#!/bin/bash
# run_profile_cpu.sh — CPU-only benchmark with power, RAM, and throughput
# Usage: ./scripts/run_profile_cpu.sh <threads> [repeat]
# Run from ~/llama.cpp/

set -e

THREADS=${1:-4}
REPEAT=${2:-10}
PROMPT=12
NUM_TOKENS=64
MODEL="$HOME/LFM2.5-1.2B-Thinking-Q4_0.gguf"
LLAMA_DIR="$HOME/llama.cpp"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG="/tmp/cpu_t${THREADS}_${TIMESTAMP}.log"
MEM_BASELINE=$(xmutil xlnx_platformstats -p 2>/dev/null | grep -oP 'MemAvailable\s*:\s*\K[0-9]+' || echo 0)

echo "=== CPU Only | T=$THREADS | R=$REPEAT ===" | tee "$LOG"
echo "" >> "$LOG"

# ─── power logger ────────────────────────────────────────────────────
( while true; do
    ts=$(date +%s)
    stats=$(xmutil xlnx_platformstats -p 2>/dev/null)
    power=$(echo "$stats" | grep -oP 'SOM total power\s*:\s*\K[0-9.]+' || echo "0")
    lpdt=$(echo "$stats"  | grep -oP 'LPD temperature measurement\s*:\s*\K[0-9]+' || echo "0")
    plt=$(echo "$stats"   | grep -oP 'PL temperature\s*:\s*\K[0-9]+' || echo "0")
    memavail=$(echo "$stats" | grep -oP 'MemAvailable\s*:\s*\K[0-9]+' || echo "0")
    echo "$ts power=$power lpdt=$lpdt plt=$plt memavail=$memavail"
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

# ─── RAM logger (polls llama-bench by name) ────────────────────────
BENCH_NAME="llama-bench"
( while true; do
    ts=$(date +%s)
    pid=$(pgrep -f "$BENCH_NAME" | head -1)
    rss=0
    [ -n "$pid" ] && rss=$(awk '/^VmRSS:/ {print $2}' /proc/$pid/status 2>/dev/null || echo 0)
    [ "$rss" = "0" ] && break
    echo "$ts rss=$rss"
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

[ $BENCH_EXIT -eq 0 ] || echo "WARNING: bench exited with code $BENCH_EXIT" | tee -a "$LOG"

# ─── summary ────────────────────────────────────────────────────────
echo "" | tee -a "$LOG"
echo "=== Summary CPU T$THREADS ===" | tee -a "$LOG"

PP_LINE=$(grep '±' "$LOG" | grep -v ' tg' | tail -1 || true)
TG_LINE=$(grep '±' "$LOG" | grep ' tg'  | tail -1 || true)
[ -n "$PP_LINE" ] && echo "Prefill t/s:  $PP_LINE" | tee -a "$LOG"
[ -n "$TG_LINE" ] && echo "Decode  t/s:  $TG_LINE" | tee -a "$LOG"

POWER_SAMPLES=$(grep -oP 'power=\K[0-9.]+' "$LOG" || true)
if [ -n "$POWER_SAMPLES" ]; then
  POWER_MW=$(echo "$POWER_SAMPLES" | awk '$1>0 {s+=$1; n++} END {if(n) printf "%.1f", s/n}')
  N=$(echo "$POWER_SAMPLES" | awk '$1>0 {n++} END {print n+0}')
  echo "Avg power: $(echo "scale=2; $POWER_MW/1000" | bc) W  ($POWER_MW mW, $N samples)" | tee -a "$LOG"
fi

LPD_TEMP=$(grep -oP 'lpdt=\K[0-9]+' "$LOG" | awk '{s+=$1; n++} END {if(n) printf "%.0f", s/n}')
PL_TEMP=$(grep -oP 'plt=\K[0-9]+' "$LOG" | awk '{s+=$1; n++} END {if(n) printf "%.0f", s/n}')
[ -n "$LPD_TEMP" ] && echo "Avg temp (C): LPD=$LPD_TEMP  PL=$PL_TEMP" | tee -a "$LOG"

RAM_MAX=$(grep -oP 'rss=\K[0-9]+' "$LOG" | awk '{if($1>max) max=$1} END {print max}')
if [ -n "$RAM_MAX" ] && [ "$RAM_MAX" -gt 0 ]; then
  RAM_MB=$((RAM_MAX / 1024))
  echo "Peak RSS: ${RAM_MB} MB" | tee -a "$LOG"
fi

MEM_MIN=$(grep -oP 'memavail=\K[0-9]+' "$LOG" | awk '$1>0 {print}' | sort -n | head -1)
if [ -n "$MEM_MIN" ] && [ "$MEM_BASELINE" -gt 0 ]; then
  USED_MB=$(( (MEM_BASELINE - MEM_MIN) / 1024 ))
  echo "Peak memory used: ${USED_MB} MB (system MemAvailable delta)" | tee -a "$LOG"
fi

echo "Log: $LOG" | tee -a "$LOG"
