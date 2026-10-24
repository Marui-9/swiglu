#!/bin/bash
# run_profile_cpu.sh — CPU-only benchmark with power, RAM, and throughput
# Usage: ./scripts/run_profile_cpu.sh <threads> [repeat]
# Run from ~/llama.cpp/

set -e

THREADS=${1:-4}
REPEAT=${2:-10}
PROMPT=12
NUM_TOKENS=64
MODEL="${MODEL:-$HOME/LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf}"
LLAMA_DIR="$HOME/llama.cpp"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG="${LOG_DIR:-/tmp}/cpu_t${THREADS}_${TIMESTAMP}.log"

echo "=== CPU Only | T=$THREADS | R=$REPEAT ===" | tee "$LOG"
echo "" >> "$LOG"

# ─── power logger ────────────────────────────────────────────────────
( while true; do
    ts=$(date +%s)
    stats=$(xmutil xlnx_platformstats -p 2>/dev/null)
    power=$(echo "$stats" | grep -oP 'SOM total power\s*:\s*\K[0-9.]+' || echo "0")
    lpdt=$(echo "$stats"  | grep -oP 'LPD temperature measurement\s*:\s*\K[0-9]+' || echo "0")
    plt=$(echo "$stats"   | grep -oP 'PL temperature\s*:\s*\K[0-9]+' || echo "0")
    echo "$ts power=$power lpdt=$lpdt plt=$plt"
    sleep 1
  done ) >> "$LOG" &
POWER_PID=$!

# ─── run benchmark ──────────────────────────────────────────────────
cd "$LLAMA_DIR"
echo "[$(date +%T)] Running llama-bench (CPU Only)..." | tee -a "$LOG"
env SWIGLU_DEBUG=0 ./build/bin/llama-bench \
  -m "$MODEL" -p $PROMPT -n $NUM_TOKENS -t $THREADS -r $REPEAT \
  2>&1 | tee -a "$LOG" &
BENCH_PID=$!

# ─── RAM logger: VmRSS and VmHWM (kernel peak RSS) of llama-bench ─────
# pgrep -x matches the process name exactly, so it skips the sudo wrapper.
BENCH_NAME="llama-bench"
( pid=""
  for i in $(seq 1 50); do
    pid=$(pgrep -x "$BENCH_NAME" | head -1)
    [ -n "$pid" ] && break
    sleep 0.2
  done
  while [ -n "$pid" ] && [ -e /proc/$pid ]; do
    ts=$(date +%s)
    mem=$(awk '/^VmRSS:/ {r=$2} /^VmHWM:/ {h=$2} END {print r, h}' /proc/$pid/status 2>/dev/null) || break
    [ -z "$mem" ] && break
    set -- $mem
    echo "$ts rss=$1 hwm=$2"
    sleep 1
  done ) >> "$LOG" &
RAM_PID=$!

# ─── wait for bench ──────────────────────────────────────────────────
wait $BENCH_PID
BENCH_EXIT=$?

# ─── stop loggers ────────────────────────────────────────────────────
kill $POWER_PID $RAM_PID 2>/dev/null || true
wait $POWER_PID $RAM_PID 2>/dev/null || true
sleep 0.5

# ─── summary ────────────────────────────────────────────────────────
echo "" | tee -a "$LOG"
echo "=== Summary CPU T$THREADS ===" | tee -a "$LOG"

TPS_LINE=$(grep '±' "$LOG" | tail -1 || true)
[ -n "$TPS_LINE" ] && echo "Throughput: $TPS_LINE" | tee -a "$LOG"

POWER_SAMPLES=$(grep -oP 'power=\K[0-9.]+' "$LOG" || true)
if [ -n "$POWER_SAMPLES" ]; then
  POWER_MW=$(echo "$POWER_SAMPLES" | awk '{s+=$1; n++} END {if(n) printf "%.1f", s/n}')
  N=$(echo "$POWER_SAMPLES" | wc -l)
  echo "Avg power: $(echo "scale=2; $POWER_MW/1000" | bc) W  ($POWER_MW mW, $N samples)" | tee -a "$LOG"
fi

LPD_TEMP=$(grep -oP 'lpdt=\K[0-9]+' "$LOG" | awk '{s+=$1; n++} END {if(n) printf "%.0f", s/n}')
PL_TEMP=$(grep -oP 'plt=\K[0-9]+' "$LOG" | awk '{s+=$1; n++} END {if(n) printf "%.0f", s/n}')
[ -n "$LPD_TEMP" ] && echo "Avg temp (C): LPD=$LPD_TEMP  PL=$PL_TEMP" | tee -a "$LOG"

RAM_MAX=$(grep -oP 'hwm=\K[0-9]+' "$LOG" | awk '{if($1>max) max=$1} END {print max}')
if [ -n "$RAM_MAX" ] && [ "$RAM_MAX" -gt 0 ]; then
  RAM_MB=$((RAM_MAX / 1024))
  echo "Peak RSS (VmHWM): ${RAM_MB} MB" | tee -a "$LOG"
fi

echo "Log: $LOG" | tee -a "$LOG"
