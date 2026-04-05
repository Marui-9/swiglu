import sys

def categorize_operation(name, op):
    name = name.lower()
    op = op.upper().strip()
    
    # 1. Exact Math Operations (If they exist)
    if op in ['ROPE', 'ROPE_EXT']: return "Positional Encodings (RoPE)"
    if op in ['SOFT_MAX', 'DIAG_MASK_INF', 'SCALE']: return "Attention Math & Masking"
    if op in ['VIEW', 'RESHAPE', 'PERMUTE', 'CPY', 'CONT', 'DUP', 'TRANSPOSE', 'CONCAT']: return "Memory Ops & KV Cache"
    if op == 'ADD': return "Residual Connections & Addition"
    if op in ['SILU', 'GELU']: return "Activation Functions (SwiGLU)"
    if op in ['RMS_NORM', 'NORM']: return "RMSNorm / LayerNorm"
    if op == 'GET_ROWS': return "Input Embedding Lookup"
    if 'CONV' in op: return "Gated Short Convolution"
    
    # 2. Fallback to Name-based parsing (Handles missing OPs and MatMuls)
    if op == 'UNKNOWN_OP' or 'MUL' in op or 'MUL_MAT' in op:
        if any(x in name for x in ['attn_q', 'attn_k', 'attn_v', 'attn_output', 'wq', 'wk', 'wv', 'wo', 'q_proj', 'k_proj', 'v_proj', 'out_proj']):
            return "GQA Attention (MatMul)"
        elif any(x in name for x in ['ffn_gate', 'ffn_up', 'ffn_down', 'mlp', 'ffn']):
            return "SwiGLU (MatMul)"
        elif 'output' in name or 'result_output' in name: 
            return "Final Linear Projection"
        elif any(x in name for x in ['conv', 'time_mix', 'dt', 'state', 'x_proj']):
            return "Gated Short Convolution (LTC Weights)"
        elif 'token_embd' in name:
            return "Input Embedding"
            
    # Catch-all
    return "Unmapped Nodes"

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 parse_profiling.py <profile_output.log>")
        sys.exit(1)

    log_file = sys.argv[1]
    block_times = {}
    unmapped = {}
    total_time = 0.0

    with open(log_file, 'r') as f:
        for line in f:
            if 'LFM_PROFILE |' in line:
                parts = [p.strip() for p in line.split('|')]
                
                # Automatically handle both the 3-part and 4-part log formats
                if len(parts) >= 4:
                    name = parts[1]
                    op = parts[2]
                    time_str = parts[3]
                elif len(parts) == 3:
                    name = parts[1]
                    op = "UNKNOWN_OP"
                    time_str = parts[2]
                else:
                    continue # Malformed line
                    
                try:
                    time_val = float(time_str)
                except ValueError:
                    continue # Skip if time didn't parse correctly
                
                category = categorize_operation(name, op)
                block_times[category] = block_times.get(category, 0.0) + time_val
                total_time += time_val
                
                if category == "Unmapped Nodes":
                    node_id = f"{name} ({op})"
                    unmapped[node_id] = unmapped.get(node_id, 0.0) + time_val

    print("\n" + "="*75)
    print(f"{'LFM2.5-1.2B CPU EXECUTION PROFILE':^75}")
    print("="*75)
    print(f"{'Architectural Block':<35} | {'Time (us)':<15} | {'% of Total':<10}")
    print("-" * 75)
    
    for block, time in sorted(block_times.items(), key=lambda x: x[1], reverse=True):
        pct = (time / total_time * 100) if total_time > 0 else 0
        print(f"{block:<35} | {time:<15.0f} | {pct:>5.2f}%")

    if unmapped:
        print("\n" + "-" * 75)
        print(" UNMAPPED MATH OPERATIONS (TOP 10):")
        print("-" * 75)
        for name, time in sorted(unmapped.items(), key=lambda x: x[1], reverse=True)[:10]:
            pct = (time / total_time * 100) if total_time > 0 else 0
            print(f"  -> {name:<35} | {time:<15.0f} | {pct:>5.2f}%")

if __name__ == "__main__":
    main()
