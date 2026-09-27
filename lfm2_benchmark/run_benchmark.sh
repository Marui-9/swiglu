#!/bin/bash
# run_benchmark.sh — LFM2.5-1.2B CPU-only throughput benchmark
# Usage: ./run_benchmark.sh [model.gguf]
#
# Searches for llama-bench in common locations.
# Runs T1--T4, writes one log per thread count.
# No root, no custom env vars, no external dependencies.
#
# The model file is auto-detected from common filenames if not provided.

set -e

MODEL="${1:-}"
if [ -z "$MODEL" ]; then
  for candidate in \
    ./lfm2.5-1.2B-Q4_K.gguf \
    ./LFM2.5-1.2B-Thinking-Q4_K_M.gguf \
    ./*q4_k_m.gguf \
    ./*Q4_K_M.gguf \
    ./*.gguf; do
    if [ -f "$candidate" ]; then
      MODEL="$candidate"
      break
    fi
  done
  if [ -z "$MODEL" ]; then
    MODEL="./lfm2.5-1.2B-Q4_K.gguf"
  fi
fi
PROMPT=4
NUM_TOKENS=64
REPEAT=10
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# ─── find llama-bench ────────────────────────────────────────────────
LLAMA_BENCH=""
for candidate in \
  ./llama.cpp/build/bin/llama-bench \
  ./build/bin/llama-bench \
  ../llama.cpp/build/bin/llama-bench \
  ~/llama.cpp/build/bin/llama-bench \
  "$(command -v llama-bench 2>/dev/null)"; do
  if [ -x "$candidate" ]; then
    LLAMA_BENCH="$candidate"
    break
  fi
done

if [ -z "$LLAMA_BENCH" ]; then
  echo "ERROR: llama-bench not found."
  echo "Place this script next to a llama.cpp/build/ directory, or"
  echo "install llama-bench to your PATH."
  echo ""
  echo "To build:"
  echo "  git clone https://github.com/ggml-org/llama.cpp"
  echo "  cd llama.cpp && mkdir build && cd build"
  echo "  cmake .. -DCMAKE_BUILD_TYPE=Release && make -j llama-bench"
  exit 1
fi

# ─── check model ─────────────────────────────────────────────────────
if [ ! -f "$MODEL" ]; then
  echo "ERROR: model not found at $MODEL"
  echo "Download: https://huggingface.co/LiquidAI/LFM2.5-1.2B-Thinking"
  exit 1
fi

echo "=== LFM2.5-1.2B CPU Benchmark ==="
echo "Binary : $LLAMA_BENCH"
echo "Model  : $MODEL"
echo "Flags  : -p $PROMPT -n $NUM_TOKENS -r $REPEAT"
echo ""

# ─── system info ─────────────────────────────────────────────────────
echo "=== System Info ==="
echo "Hostname : $(hostname)"
echo "Kernel   : $(uname -r)"
echo "Arch     : $(uname -m)"
if [ -f /proc/cpuinfo ]; then
  MODEL_NAME=$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs || echo "unknown")
  CORES=$(grep -c '^processor' /proc/cpuinfo || echo "unknown")
  echo "CPU      : $MODEL_NAME"
  echo "Cores    : $CORES"
fi
if [ -f /proc/meminfo ]; then
  RAM_KB=$(grep '^MemTotal:' /proc/meminfo | awk '{print $2}')
  RAM_GB=$(echo "scale=1; $RAM_KB/1024/1024" | bc)
  echo "RAM      : ${RAM_GB} GB"
fi
echo ""

# ─── run benchmarks ──────────────────────────────────────────────────
for t in 1 2 3 4; do
  LOG="lmf2_bench_T${t}_${TIMESTAMP}.log"
  echo "[$(date +%T)] Running T=$t..."
  echo "=== LFM2.5-1.2B  T=$t  -p $PROMPT -n $NUM_TOKENS -r $REPEAT ===" > "$LOG"
  "$LLAMA_BENCH" \
    -m "$MODEL" \
    -p $PROMPT \
    -n $NUM_TOKENS \
    -t $t \
    -r $REPEAT \
    2>&1 | tee -a "$LOG"
  echo "[$(date +%T)] Done.  Log: $LOG"
  echo ""
done

echo "=== All done ==="
echo "Logs: lmf2_bench_T{1,2,3,4}_${TIMESTAMP}.log"
echo "Send these files back for comparison."
