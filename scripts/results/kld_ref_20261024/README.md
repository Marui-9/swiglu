# Quantization cost against the f16/q8_0 reference (2026-10-24)

Point 2 of the follow-up asked how much quality the Q4_K GGUFs lose against an unquantized
reference, and how far the FPGA path is from the CPU on the same GGUF. All runs score
wikitext-2 (`-c 256 --chunks 24`, 6,144 tokens) against saved logits
(`scripts/analysis/kld_ref.sh`, a copy is `kld_ref.sh` here):
1. Q4_K_M-fromf16q8 on the CPU vs f16/q8_0 (PC).
2. allQ4Kffn on the CPU vs f16/q8_0 (board).
3. allQ4Kffn through the IP vs f16/q8_0 (board, rebuild_s2fix bitstream).
4. allQ4Kffn on the CPU, writing its own logits as a base (board).
5. allQ4Kffn through the IP vs run 4 (board): FPGA vs CPU directly, 24 chunks.

Runs 2-5 ran on 2026-10-24, 09:50-11:21 UTC (`run2.log`), `-b 256 -ub 64 -t 4`.
`run2.log` records the md5 of the reference logits, wiki.test.raw, the GGUF
(2e1c6368a0e5ed7ce6cfe2006cdd9d6b) and the board's ggml-cpu.c.

## Results

| vs f16/q8_0 (24 chunks) | Q4_K_M, CPU (run 1) | allQ4Kffn, CPU (run 2) | allQ4Kffn, FPGA (run 3) |
|---|---|---|---|
| Log | `pc_q4km_vs_ref.log` | `cpu_allq4k.log` | `hw_allq4k.log` |
| Mean PPL(Q) | 55.664368 ± 3.647443 | 55.178646 ± 3.594054 | 57.487477 ± 3.756746 |
| PPL(Q)/PPL(base) | 1.184104 ± 0.015283 | 1.173772 ± 0.015587 | 1.222886 ± 0.018259 |
| Mean KLD | 0.153433 ± 0.003147 | 0.166073 ± 0.003399 | 0.210197 ± 0.004346 |
| Median / 99 % KLD | 0.109874 / 0.797499 | 0.120900 / 0.900766 | 0.148852 / 1.120911 |
| Same top token | 77.264 ± 0.759 % | 75.951 ± 0.774 % | 73.852 ± 0.796 % |
| RMS Δp | 7.748 ± 0.305 % | 8.238 ± 0.317 % | 9.000 ± 0.325 % |

PPL(base) is 47.009676 ± 2.996108 in all three: llama-perplexity recomputes it from the
stored reference logits. The reference run itself printed 47.1429 (`ref_f16q8.log`); the
gap is the stored logits' reduced precision.

| FPGA vs CPU, same GGUF (run 5, `hw_vs_cpu24.log`) | 24 chunks, T4 | 6 chunks, T2 (`../rebuild_x16_20261023/ppl_hw.log`) |
|---|---|---|
| PPL(Q)/PPL(base) | 1.045784 ± 0.006337 | 1.034376 ± 0.011605 |
| Mean KLD | 0.034755 ± 0.000749 | 0.030154 |
| Median / 99 % KLD | 0.023195 / 0.194668 | |
| Same top token | 88.091 ± 0.587 % | 87.795 % |
| RMS Δp | 3.492 ± 0.139 % | 3.056 ± 0.230 % |

Run 4 (`cpu_allq4k_base.log`) prints PPL = 55.1786 ± 3.59405, the same as run 2, so the
CPU path is deterministic across runs. Run 5's PPL(base) of 54.970683 is again recomputed
from stored logits.

**Reading (derived from the tables):**
- **Q4_K on every down projection** costs little on the CPU: KLD 0.166 vs 0.153 for the
  default Q4_K_M mix (+0.013), same top token 75.95 % vs 77.26 %. The PPL ratio is slightly
  lower (1.174 vs 1.184), within the error bars.
- **The FPGA path** adds KLD 0.044 on top of the CPU's 0.166 against the reference, and its
  PPL ratio is 1.223 vs 1.174. Measured directly against the CPU over all 24 chunks, it
  scores KLD 0.035 and a PPL ratio of 1.046, slightly above the 6-chunk run (0.030, 1.034).
  At chunk 6 its running values equal the 6-chunk run's exactly (KLD 0.03015, same top
  87.795 %, RMS Δp 3.056 %), although that run used `-t 2` and this one `-t 4`. The higher
  24-chunk values come from the added text (chunks 7-24), not from the setup.
- So the IP's own 8-bit stages (x and h) cost about a quarter of what the Q4_K weights
  already cost against f16/q8_0 (0.044 / 0.166, derived), and it agrees with the CPU on the
  top token 88 % of the time.
- **Speed in these runs:** prompt eval 190.46 ms per token through the IP vs 230.33 ms on
  the CPU (`llama_perf_context_print`, batched `-ub 64`, T4). This is batched evaluation,
  not decode; the decode figures are in `../rebuild_s2fix_final_20261024/`.

## The stock Q4_K_M GGUF is corrupt

`LFM2.5-1.2B-Thinking-Q4_K_M.gguf` (md5 d3cbb0bcb26a1830f4679a1ae8e8c754) has the same md5
on the USB key and on the board. It is unusable:
- **Norm weights** (`stock_q4km_norms.txt`, `scripts/analysis/gguf_norms.py`): the F32
  `ffn_norm` weights of blk.0-3 are equal to those of a Q4_K_M rebuilt from the f16/q8_0
  GGUF. From blk.4 on they hold NaN and values near ±3e38.
- **Perplexity** (`pc_ppl4_LFM2.5-1.2B-Thinking-Q4_K_M.log`, PC, wikitext-2,
  `-c 256 --chunks 4`): every chunk scores 65536.0000, i.e. a uniform distribution over the
  vocabulary. The rebuilt Q4_K_M scores 51.7115 ± 8.08186 under the same command
  (`pc_ppl4_LFM2.5-1.2B-Thinking-Q4_K_M-fromf16q8.log`).

What this affects:
- The earlier "CPU-only, stock Q4_K_M" runs very likely used a corrupt copy. That includes
  the q4k_final baseline (0.88 / 1.66 / 2.36 / 2.31 t/s, `../latest_benchmarks/cpu_t*_q4k.log`).
  - Their logs do not name the file, and llama-bench's "694.76 MiB" fits both this file and
    the rebuilt one.
  - The USB copy's mtime is 2026-03-18, before those runs.
  - Their timing is still a valid measurement of a Q4_K_M graph. Only t/s was recorded, so
    nothing shows whether their output was meaningful.
- The "their F32 norm weights differ" note about this file and allQ4Kffn is this
  corruption, not a difference between checkpoints.
- The 2026-10-23 runs (`../fixed_driver_20261023/`, `../rebuild_x16_20261023/`) and the
  2026-10-24 runs (`../rebuild_s2fix_final_20261024/`) used allQ4Kffn on both paths, so they are
  not affected.

Replacement: `LFM2.5-1.2B-Thinking-Q4_K_M-fromf16q8.gguf` (md5
76ede564d46121ffe9c4e7cf6c54c293).
- It is the default Q4_K_M recipe, quantized on the PC from
  `LFM2.5-1.2B-Thinking-f16_q8_0.gguf`. allQ4Kffn comes from the same source.
- `quantize_q4km_fromf16q8.log`: 1574.37 MiB → 694.76 MiB (4.98 BPW).
- A copy is on the USB key (`misc/`).

## Run 1 details: Q4_K_M-fromf16q8 vs the f16/q8_0 reference (PC)

- **Reference** (`ref_f16q8.log`): `LFM2.5-1.2B-Thinking-f16_q8_0.gguf` on the PC,
  wikitext-2 test (`wiki.test.raw`, md5 7c0137fc034ddbc56a296bce31b4f7fb), `-c 256
  --chunks 24`. It prints "Final estimate: PPL = 47.1429 +/- 3.01439".
  - The saved logits (`ref_f16q8.kld`, md5 db8b9dad946efe9935b71a7c82684fa7, 400 MB) are
    not tracked by git. They are in `data/kld/` (git-ignored, see `data/README.md`), with
    run 4's `cpu_allq4k24.kld` (md5 29fad3475c9cc821f6823cca6b5ff227); the board copies
    were deleted after the md5 check.
- **Q4_K_M** (`pc_q4km_vs_ref.log`): same arguments with `-b 256 -ub 64`, scored with
  `--kl-divergence`, 24 chunks.

| Q4_K_M-fromf16q8 vs f16/q8_0 | `pc_q4km_vs_ref.log` |
|---|---|
| Mean PPL(Q) / PPL(base) | 55.664368 ± 3.647443 / 47.009676 ± 2.996108 |
| PPL(Q)/PPL(base) | 1.184104 ± 0.015283 |
| Mean KLD | 0.153433 ± 0.003147 |
| Median / 99 % KLD | 0.109874 / 0.797499 |
| Same top token | 77.264 ± 0.759 % |
| RMS Δp | 7.748 ± 0.305 % |

The board's partial copy (`board_cpu_q4km_partial.log`, `-t 4`, ARM) gives close
values at chunk 10: running KLD 0.14389 against the PC's 0.14327.

## Files

| File | What |
|---|---|
| `stock_q4km_norms.txt` | md5 and `ffn_norm` stats of the stock and the rebuilt Q4_K_M |
| `pc_ppl4_*.log` | 4-chunk perplexity of both GGUFs on the PC |
| `ref_f16q8.log` | f16/q8_0 reference run (writes `ref_f16q8.kld`) |
| `pc_q4km_vs_ref.log` | Q4_K_M-fromf16q8 vs the reference, 24 chunks |
| `board_cpu_q4km_partial.log` | the same on the board, stopped after chunk 10 |
| `quantize_q4km_fromf16q8.log` | `llama-quantize` log of the replacement GGUF |
| `kld_ref.sh`, `run2.log` | board script for runs 2-5 and its md5/timestamp log |
| `cpu_allq4k.log` | run 2: allQ4Kffn CPU vs the reference |
| `hw_allq4k.log` | run 3: allQ4Kffn through the IP vs the reference |
| `cpu_allq4k_base.log` | run 4: allQ4Kffn CPU, writes `cpu_allq4k24.kld` |
| `hw_vs_cpu24.log` | run 5: IP vs run 4, 24 chunks |

The PC runs used a scratch llama.cpp b8210 build. The board runs used the board's llama.cpp tree with
llama-mods. Both print `build: 0 (unknown)`.
