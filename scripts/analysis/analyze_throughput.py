#!/usr/bin/env python3
"""
Analyze accelerator throughput and runtime breakdown from benchmark logs.

IMPORTANT: The accelerator is used for BOTH prefill and decode phases.
- Prefill (4 tokens) goes through hardware processing
- Decode (64 tokens) goes through hardware processing
- Each phase has its own measured throughput from power_results.txt

Uses measured throughput data from power_results.txt and hardware timing from output.txt.
"""

from pathlib import Path
from collections import defaultdict
import re


def parse_power_results(filepath):
    """Extract throughput and phase breakdown from power_results.txt"""
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Find the metrics table
    metrics = {}
    for line in content.split('\n'):
        if 'ACCEL' in line and 'Decode' in line:
            parts = line.split('|')
            if len(parts) >= 4:
                try:
                    # Format: "| ACCEL | Decode | 2.08 +- 0.02 |"
                    tps_str = parts[3].strip().split()[0]
                    metrics['decode_tps'] = float(tps_str)
                except:
                    pass
        elif 'ACCEL' in line and 'Prefill' in line:
            parts = line.split('|')
            if len(parts) >= 4:
                try:
                    tps_str = parts[3].strip().split()[0]
                    metrics['prefill_tps'] = float(tps_str)
                except:
                    pass
    
    return metrics


def parse_hardware_timing(filepath):
    """Extract per-token hardware compute time from output.txt debug logs"""
    elapsed_times = []
    with open(filepath, 'r') as f:
        for line in f:
            match = re.search(r'elapsed=(\d+)ms', line)
            if match:
                elapsed_times.append(int(match.group(1)))
    
    # Filter out the first call (overhead spike)
    if elapsed_times and elapsed_times[0] == 0:
        elapsed_times = elapsed_times[1:]
    
    avg_hw_ms = sum(elapsed_times) / len(elapsed_times) if elapsed_times else 0
    return {
        'samples': elapsed_times,
        'avg_ms_per_token': avg_hw_ms,
    }


def main():
    base_path = Path(__file__).parent
    power_results = base_path / 'results' / 'power_results.txt'
    debug_output = base_path.parent / 'docs' / 'output.txt'
    
    # Test parameters
    PREFILL_TOKENS = 4
    DECODE_TOKENS = 64
    NUM_LAYERS = 16
    NUM_RUNS = 10
    
    print("=" * 80)
    print("ACCELERATOR THROUGHPUT & RUNTIME ANALYSIS")
    print("=" * 80)
    print(f"\nTest configuration:")
    print(f"  Prefill tokens:     {PREFILL_TOKENS}")
    print(f"  Decode tokens:      {DECODE_TOKENS}")
    print(f"  Total tokens/run:   {PREFILL_TOKENS + DECODE_TOKENS}")
    print(f"  Transformer layers: {NUM_LAYERS}")
    print(f"  Number of runs:     {NUM_RUNS}")
    
    # Parse measured data
    metrics = parse_power_results(power_results)
    hw_timing = parse_hardware_timing(debug_output)
    
    if not metrics:
        print("\nERROR: Could not parse power_results.txt")
        return
    
    prefill_tps = metrics.get('prefill_tps', 2.47)
    decode_tps = metrics.get('decode_tps', 2.08)
    
    print(f"\n" + "=" * 80)
    print("MEASURED THROUGHPUT (from power_results.txt)")
    print("=" * 80)
    print(f"Prefill (ACCEL):     {prefill_tps:.2f} tokens/s")
    print(f"Decode (ACCEL):      {decode_tps:.2f} tokens/s")
    
    # Calculate per-phase timing
    prefill_time_s = PREFILL_TOKENS / prefill_tps
    decode_time_s = DECODE_TOKENS / decode_tps
    total_time_s = prefill_time_s + decode_time_s
    
    print(f"\n" + "=" * 80)
    print("PER-RUN BREAKDOWN (Both phases use ACCELERATOR)")
    print("=" * 80)
    print(f"\nPrefill phase (ACCELERATOR):")
    print(f"  Tokens:             {PREFILL_TOKENS}")
    print(f"  Throughput:         {prefill_tps:.2f} t/s")
    print(f"  Duration:           {prefill_time_s:.2f}s")
    print(f"  % of total:         {prefill_time_s/total_time_s*100:.1f}%")
    
    print(f"\nDecode phase (ACCELERATOR):")
    print(f"  Tokens:             {DECODE_TOKENS}")
    print(f"  Throughput:         {decode_tps:.2f} t/s")
    print(f"  Duration:           {decode_time_s:.2f}s")
    print(f"  % of total:         {decode_time_s/total_time_s*100:.1f}%")
    
    print(f"\nTotal per run:")
    print(f"  Total tokens:       {PREFILL_TOKENS + DECODE_TOKENS}")
    print(f"  Total duration:     {total_time_s:.2f}s")
    print(f"  Per 10 runs:        {total_time_s * NUM_RUNS:.1f}s")
    
    # Hardware utilization analysis
    if hw_timing['samples']:
        print(f"\n" + "=" * 80)
        print("HARDWARE COMPUTE TIME (from output.txt debug logs)")
        print("=" * 80)
        print(f"\nPer-token timing:")
        print(f"  Sample count:       {len(hw_timing['samples'])} tokens")
        print(f"  Average:            {hw_timing['avg_ms_per_token']:.1f}ms/token")
        print(f"  Min:                {min(hw_timing['samples'])}ms")
        print(f"  Max:                {max(hw_timing['samples'])}ms")
        
        # Calculate expected HW time for full inference
        hw_per_layer_ms = hw_timing['avg_ms_per_token']
        total_hw_tokens = PREFILL_TOKENS + DECODE_TOKENS
        total_hw_time = (hw_per_layer_ms * total_hw_tokens * NUM_LAYERS) / 1000
        
        print(f"\nFull inference hardware time:")
        print(f"  ({hw_per_layer_ms:.1f}ms/token) × ({total_hw_tokens} tokens) × ({NUM_LAYERS} layers)")
        print(f"  = {total_hw_time:.2f}s")
        
        # Overhead analysis
        total_measured = prefill_time_s + decode_time_s
        overhead = total_measured - total_hw_time
        hw_util_pct = (total_hw_time / total_measured) * 100 if total_measured > 0 else 0
        
        print(f"\nHardware utilization:")
        print(f"  HW compute time:    {total_hw_time:.2f}s ({hw_util_pct:.1f}%)")
        print(f"  Overhead/Polling:   {overhead:.2f}s ({100-hw_util_pct:.1f}%)")
        print(f"    (DMA, register programming, interrupt polling)")
    
    # Detailed breakdown by token phase
    print(f"\n" + "=" * 80)
    print("ACCELERATOR UTILIZATION ANALYSIS BY PHASE")
    print("=" * 80)
    
    if hw_timing['samples']:
        hw_ms = hw_timing['avg_ms_per_token']
        total_tokens_all = PREFILL_TOKENS + DECODE_TOKENS
        
        # Calculate per-phase hardware times
        # (All samples are at ~19ms, so we use the average across all)
        prefill_hw_total = (hw_ms * PREFILL_TOKENS * NUM_LAYERS) / 1000
        decode_hw_total = (hw_ms * DECODE_TOKENS * NUM_LAYERS) / 1000
        total_hw_compute = prefill_hw_total + decode_hw_total
        
        print(f"\nPrefill phase:")
        print(f"  Hardware compute:   {prefill_hw_total:.2f}s")
        print(f"  Measured runtime:   {prefill_time_s:.2f}s")
        prefill_overhead = prefill_time_s - prefill_hw_total
        print(f"  Overhead/Polling:   {prefill_overhead:.2f}s ({prefill_overhead/prefill_time_s*100:.1f}%)")
        
        print(f"\nDecode phase:")
        print(f"  Hardware compute:   {decode_hw_total:.2f}s")
        print(f"  Measured runtime:   {decode_time_s:.2f}s")
        decode_overhead = decode_time_s - decode_hw_total
        print(f"  Overhead/Polling:   {decode_overhead:.2f}s ({decode_overhead/decode_time_s*100:.1f}%)")
        
        # Total analysis
        print(f"\nTotal for all {total_tokens_all} tokens:")
        print(f"  Hardware compute:   {total_hw_compute:.2f}s ({total_hw_compute/total_measured*100:.1f}%)")
        print(f"  Measured runtime:   {total_measured:.2f}s")
        print(f"  Total overhead:     {total_measured - total_hw_compute:.2f}s ({(total_measured - total_hw_compute)/total_measured*100:.1f}%)")
    
    # Summary section
    print(f"\n" + "=" * 80)
    print("SUMMARY")
    print("=" * 80)
    total_inference = total_time_s
    total_tokens = PREFILL_TOKENS + DECODE_TOKENS
    print(f"\nAccelerator active during BOTH prefill and decode phases")
    print(f"Single inference ({PREFILL_TOKENS} prefill + {DECODE_TOKENS} decode): {total_inference:.2f}s")
    print(f"Total for {NUM_RUNS} runs:                            {total_inference * NUM_RUNS:.1f}s")
    print(f"Overall throughput:                       {total_tokens / total_inference:.2f} t/s")
    
    if hw_timing['samples']:
        print(f"\nKey insight:")
        print(f"  Of the {total_measured:.2f}s runtime:")
        print(f"  - {total_hw_compute:.2f}s is actual hardware computation ({total_hw_compute/total_measured*100:.1f}%)")
        print(f"  - {total_measured - total_hw_compute:.2f}s is overhead/latency ({(total_measured - total_hw_compute)/total_measured*100:.1f}%)")
        print(f"\nOverhead per token: {(total_measured - total_hw_compute) / total_tokens * 1000:.1f} ms")
        print(f"Hardware per token: {total_hw_compute / total_tokens * 1000:.1f} ms")
        print(f"Per-layer overhead: {(total_measured - total_hw_compute) / total_tokens / NUM_LAYERS * 1000:.1f} ms")


if __name__ == '__main__':
    main()
