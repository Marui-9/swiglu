"""
parse_profiling_wallclock.py
Usage:
    python3 parse_profiling_wallclock.py <log>
    python3 parse_profiling_wallclock.py <log> --decode-ms 1730 --prefill-ms 263

Wall-clock times come from llama-bench (tg64 / pp4 columns, multiply token count
by ms-per-token) or from llama_print_timings in the log if present.

Without --decode-ms / --prefill-ms the script falls back to node-sum normalisation
(same as parse_profiling.py) and notes that overhead is not accounted for.
"""

import sys
import re
import argparse


def categorize_operation(name, op):
    name = name.lower()
    op   = op.upper().strip()

    if op in ['ROPE', 'ROPE_EXT']:                              return "Positional Encodings (RoPE)"
    if op in ['SOFT_MAX', 'DIAG_MASK_INF', 'SCALE']:           return "Attention Math & Masking"
    if op in ['VIEW', 'RESHAPE', 'PERMUTE', 'CPY', 'CONT',
              'DUP', 'TRANSPOSE', 'CONCAT']:                    return "Memory Ops & KV Cache"
    if op == 'ADD':                                             return "Residual Connections & Addition"
    if op in ['SILU', 'GELU']:                                  return "Activation Functions"
    if op in ['RMS_NORM', 'NORM']:                              return "RMSNorm / LayerNorm"
    if op == 'GET_ROWS':                                        return "Input Embedding Lookup"
    if 'CONV' in op or 'SSM' in op:                            return "Gated Short Convolution"
    if op == 'FLASH_ATTN_EXT':                                  return "GQA Attention (MatMul)"

    if op in ('UNKNOWN_OP',) or 'MUL' in op:
        if any(x in name for x in ['attn_q', 'attn_k', 'attn_v', 'attn_output',
                                    'wq', 'wk', 'wv', 'wo',
                                    'q_proj', 'k_proj', 'v_proj', 'out_proj']):
            return "GQA Attention (MatMul)"
        if any(x in name for x in ['ffn_gate', 'ffn_up', 'ffn_down', 'mlp', 'ffn']):
            return "SwiGLU FFN (MatMul)"
        if 'output' in name or 'result_output' in name:
            return "Final Linear Projection (LM Head)"
        if any(x in name for x in ['conv', 'in_proj', 'out_proj',
                                    'time_mix', 'dt', 'state', 'x_proj']):
            return "Gated Short Convolution (LTC Weights)"
        if 'token_embd' in name:
            return "Input Embedding"

    return "Unmapped Nodes"


def parse_log(log_file):
    block_times  = {}
    unmapped     = {}
    node_total   = 0.0
    prompt_ms    = 0.0
    eval_ms      = 0.0

    with open(log_file, 'r') as f:
        for line in f:
            if 'LFM_PROFILE |' in line:
                parts = [p.strip() for p in line.split('|')]
                if len(parts) >= 4:
                    name, op, time_str = parts[1], parts[2], parts[3]
                elif len(parts) == 3:
                    name, op, time_str = parts[1], "UNKNOWN_OP", parts[2]
                else:
                    continue
                try:
                    t = float(time_str)
                except ValueError:
                    continue
                cat = categorize_operation(name, op)
                block_times[cat]  = block_times.get(cat, 0.0) + t
                node_total       += t
                if cat == "Unmapped Nodes":
                    key = f"{name} ({op})"
                    unmapped[key] = unmapped.get(key, 0.0) + t

            elif 'llama_print_timings' in line:
                m = re.search(r'prompt eval time\s*=\s*([\d.]+)\s*ms', line)
                if m:
                    prompt_ms = float(m.group(1))
                    continue
                m = re.search(r'\beval time\s*=\s*([\d.]+)\s*ms', line)
                if m:
                    eval_ms = float(m.group(1))

    return block_times, unmapped, node_total, prompt_ms, eval_ms


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('log', help='profile_output.log path')
    ap.add_argument('--decode-ms',  type=float, default=0.0,
                    help='Total decode wall-clock in ms (from llama-bench eval time × tokens)')
    ap.add_argument('--prefill-ms', type=float, default=0.0,
                    help='Total prefill wall-clock in ms (from llama-bench prompt eval time × tokens)')
    args = ap.parse_args()

    block_times, unmapped, node_total_us, log_prompt_ms, log_eval_ms = parse_log(args.log)

    # Prefer CLI args; fall back to in-log timings; then node-sum only
    prompt_ms = args.prefill_ms or log_prompt_ms
    eval_ms   = args.decode_ms  or log_eval_ms
    wall_us   = (prompt_ms + eval_ms) * 1000.0

    have_wallclock = wall_us > 0

    if not have_wallclock:
        wall_us = node_total_us   # fall-back: no overhead shown

    overhead_us = max(0.0, wall_us - node_total_us)

    W = 78
    print()
    print("=" * W)
    print(f"{'LFM2.5-1.2B CPU PROFILE  (wall-clock normalised)':^{W}}")
    print("=" * W)
    if prompt_ms:
        print(f"  Prefill wall-clock : {prompt_ms:>10.1f} ms")
    if eval_ms:
        print(f"  Decode  wall-clock : {eval_ms:>10.1f} ms")
    print(f"  Total   wall-clock : {wall_us/1000:>10.1f} ms", end="")
    if not have_wallclock:
        print("  [NO WALL-CLOCK DATA — percentages are node-sum relative]", end="")
    print()
    print(f"  Node execution sum : {node_total_us/1000:>10.1f} ms")
    if have_wallclock:
        print(f"  Inter-node overhead: {overhead_us/1000:>10.1f} ms  "
              f"({100*overhead_us/wall_us:.1f}% of wall-clock)")
        print()
        print("  To provide wall-clock times from llama-bench:")
        print("    pp4  t/s → prefill_ms = 4 / (t/s) * 1000")
        print("    tg64 t/s → decode_ms  = 64 / (t/s) * 1000")
    print("-" * W)
    print(f"{'Architectural Block':<40} | {'Time (ms)':<12} | {'% Wall-Clock'}")
    print("-" * W)

    # Build display dict including overhead
    display = dict(block_times)
    if have_wallclock and overhead_us > 0:
        display["Inter-node Overhead (barriers/sched)"] = overhead_us

    for block, t in sorted(display.items(), key=lambda x: x[1], reverse=True):
        pct = t / wall_us * 100
        print(f"  {block:<38} | {t/1000:<12.1f} | {pct:>5.2f}%")

    print("-" * W)
    print(f"  {'TOTAL':<38} | {wall_us/1000:<12.1f} | 100.00%")

    if unmapped:
        print()
        print("-" * W)
        print("  UNMAPPED NODES (top 10):")
        print("-" * W)
        for name, t in sorted(unmapped.items(), key=lambda x: x[1], reverse=True)[:10]:
            pct = t / wall_us * 100
            print(f"    {name:<40} {t/1000:<10.1f} ms  {pct:>5.2f}%")


if __name__ == "__main__":
    main()
