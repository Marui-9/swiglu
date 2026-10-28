#!/bin/bash
# FPGA+CPU at T1-T4 (as ../rebuild_x16_20261023/bench/run_all.sh), then CPU-only at T3 and
# T4 as a same-session control against the rebuild_x16 CPU-only numbers.
cd ~/llama.cpp
export LOG_DIR=~/s2fix/bench
mkdir -p $LOG_DIR
for T in 1 2 3 4; do
  ~/s2fix/run_profile_accel.sh $T 10
  sleep 20
done
for T in 3 4; do
  ~/s2fix/run_profile_cpu.sh $T 10
  sleep 20
done
echo ALL_DONE
