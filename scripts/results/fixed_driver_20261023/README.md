# First board run of the fixed driver (2026-10-23)

Setup:
- **Board:** KV260, kernel 5.15.0-1074, kria-accel firmware already on the board (250 MHz).
  The bitstream's identity against q4k_final is not verified.
- **Software:** llama.cpp 2cd20b72e (build 8210) plus `llama-mods/` at 17105b4, with the
  ISR fix (README.md, "Driver bugs", bug 3).
- **GGUF:** `LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf`, 696,292,512 B.
  - Source: the USB key's `LFM2.5-1.2B-Thinking-f16_q8_0.gguf`, quantized with
    `llama-quantize ... Q4_K_M --tensor-type ffn_down=q4_k`.
  - That llama-quantize had a local patch: build 8210 silently ignores an override equal to
    the default type, so stock Q4_K_M would keep Q6_K `ffn_down` on 8 layers.
  - Every FFN matrix is therefore Q4_K. The CPU and HW runs used this same file.
- **Threads:** all runs use `-t 2`.

| File | What |
|---|---|
| `greedy_cpu.txt`, `greedy_hw.txt` | `--temp 0` completion of "The three primary colors of light are", CPU vs `LLAMA_SWIHW=1` |
| `swiglu_debug_hw.log` | `SWIGLU_DEBUG=1` per-token breakdown (fpga ≈ 222 ms per token over 16 calls) |
| `ppl_cmp.sh` | the perplexity/KLD commands |
| `ppl_cpu.log`, `ppl_hw.log` | wikitext-2 test, `-c 256 --chunks 6`. CPU is the KLD base; HW is scored against it |
| `swiglu_verify.patch` | scratch `SWIGLU_VERIFY` hook (not in `llama-mods/`): float reference vs IP output per call |
| `verify_per_layer_run1.log` | first verify run (an earlier version of the patch: IP-only emulation) |
| `verify_per_layer_variants.log` | the patch as saved: per-stage INT8 variants |

How to read the verify lines:
- `cos(hw,ref)`: the IP output against a float `build_ffn()` computed from the same Q4_K
  weights.
- `cos(hw,emu_ip)`: the IP against a C emulation of its three INT8 stages:
  - x, scaled by max/127;
  - X1/X2, with a fixed ±10 range;
  - h, scaled by max/127.
- `cos(emu,ref)`: each emulated variant against the float reference. A variant either
  turns some stages off or changes the X1/X2 range:

  | Variant | X1/X2 quantization | Other stages |
  |---|---|---|
  | `ip(+-10)` | fixed ±10 | all on |
  | `ip,R=4` | fixed ±4 | all on |
  | `ip,dyn` | per-token max/127 | all on |
  | `x-only` | off | only x quantized |
  | `X12-only` | fixed ±10 | x and h off |
  | `h-only` | off | only h quantized |
  | `x+h` | off | x and h on |
