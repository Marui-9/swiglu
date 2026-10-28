#!/bin/bash
cd ~/llama.cpp
for T in 1 2 3 4; do
  ~/bench16/run_profile_accel.sh $T 10
  sleep 20
  ~/bench16/run_profile_cpu.sh $T 10
  sleep 20
done
echo ALL_DONE
