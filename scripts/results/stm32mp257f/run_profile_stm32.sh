#!/bin/bash
# run_profile_stm32.sh — CPU benchmark for STM32MP257F-DK (2x Cortex-A35)
# Usage: ./scripts/profiling/run_profile_stm32.sh [repeat]
# Run from ~/llama.cpp/
#
# Power measurement is external: Nordic PPK2 in Ampere Meter mode, inline on
# CN21 (USB-C 5V rail), connected to a separate host running nRF Power Profiler.
# Align PPK2 recording to the [BENCH START] / [BENCH STOP] timestamps in the log.

set -e

REPEAT=${1:-5}
PROMPT=12
NUM_TOKENS=32
MODEL="$HOME/lfm2.5-1.2B-Q4_K_M.gguf"
LLAMA_DIR="$HOME/llama.cpp"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG="/tmp/stm32_${TIMESTAMP}.log"

echo "=== STM32MP257F | R=$REPEAT ===" | tee "$LOG"
echo "Timestamp: $(date)" | tee -a "$LOG"
echo "" | tee -a "$LOG"

# ─── sanity checks ────────────────────────────────────────────────────
if [ ! -f "$MODEL" ]; then
  echo "ERROR: model not found at $MODEL" | tee -a "$LOG"
  exit 1
fi

if [ ! -x "$LLAMA_DIR/build/bin/llama-bench" ]; then
  echo "ERROR: llama-bench not found at $LLAMA_DIR/build/bin/llama-bench" | tee -a "$LOG"
  echo "Build with: cmake -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build --target llama-bench" | tee -a "$LOG"
  exit 1
fi

# ─── probe run to catch debug build and backend failures ──────────────
echo "Probing build..." | tee -a "$LOG"
PROBE=$("$LLAMA_DIR/build/bin/llama-bench" -m "$MODEL" -p 1 -n 1 -r 1 2>&1 || true)

if echo "$PROBE" | grep -q "debug build"; then
  echo "ERROR: debug build detected. Rebuild with -DCMAKE_BUILD_TYPE=Release." | tee -a "$LOG"
  exit 1
fi

if echo "$PROBE" | grep -q "asserts enabled"; then
  echo "ERROR: asserts enabled. Rebuild with -DCMAKE_BUILD_TYPE=Release." | tee -a "$LOG"
  exit 1
fi

if echo "$PROBE" | grep -q "failed to find ggml_backend_init"; then
  echo "ERROR: CPU backend .so failed to load. Check libggml-cpu.so is built and deployed." | tee -a "$LOG"
  exit 1
fi

echo "Build OK (release, backend loaded)." | tee -a "$LOG"
echo "" | tee -a "$LOG"

# ─── benchmark loop (T1 and T2 only — board has 2 A35 cores) ─────────
cd "$LLAMA_DIR"

for THREADS in 1 2; do
  echo "─────────────────────────────────────" | tee -a "$LOG"
  echo "[BENCH START] T=$THREADS  $(date +%T)" | tee -a "$LOG"

  ./build/bin/llama-bench \
    -m "$MODEL" -p $PROMPT -n $NUM_TOKENS -t $THREADS -r $REPEAT \
    2>&1 | tee -a "$LOG"

  echo "[BENCH STOP]  T=$THREADS  $(date +%T)" | tee -a "$LOG"
  echo "" | tee -a "$LOG"
done

# ─── summary ─────────────────────────────────────────────────────────
echo "=== Summary ===" | tee -a "$LOG"

PP_T1=$(grep ' pp12 ' "$LOG" | sed -n '1p' | sed 's/.*| *\([0-9][0-9.]*\) . [0-9.]* .$/\1/')
TG_T1=$(grep ' tg32 ' "$LOG" | sed -n '1p' | sed 's/.*| *\([0-9][0-9.]*\) . [0-9.]* .$/\1/')
PP_T2=$(grep ' pp12 ' "$LOG" | sed -n '2p' | sed 's/.*| *\([0-9][0-9.]*\) . [0-9.]* .$/\1/')
TG_T2=$(grep ' tg32 ' "$LOG" | sed -n '2p' | sed 's/.*| *\([0-9][0-9.]*\) . [0-9.]* .$/\1/')

echo "T1 Prefill: $PP_T1 t/s" | tee -a "$LOG"
echo "T1 Decode:  $TG_T1 t/s" | tee -a "$LOG"
echo "T2 Prefill: $PP_T2 t/s" | tee -a "$LOG"
echo "T2 Decode:  $TG_T2 t/s" | tee -a "$LOG"
echo "" | tee -a "$LOG"
echo "NOTE: power recorded externally via Nordic PPK2." | tee -a "$LOG"
echo "      Align PPK2 recording using [BENCH START]/[BENCH STOP] timestamps above." | tee -a "$LOG"
echo "Log: $LOG" | tee -a "$LOG"
