#!/bin/bash
export LOG_DIR=$HOME/bench16b
cd ~/llama.cpp
echo "[$(date -u +%T)] state before:"; sudo xmutil listapps | grep -E "swiglu-x16|kria-accel"
~/bench16b/run_profile_accel.sh 3 3
sleep 20
echo "[$(date -u +%T)] unloading PL"; sudo xmutil unloadapp
sudo xmutil listapps | grep -E "swiglu-x16|kria-accel"; ls /dev/uio* ; grep -l swiglu /sys/class/uio/*/name 2>/dev/null || echo "no swiglu uio"
sleep 20
for T in 1 2 3 4; do
  ~/bench16b/run_profile_cpu.sh $T 10
  sleep 20
done
echo "[$(date -u +%T)] reloading swiglu-x16"; sudo xmutil loadapp swiglu-x16
sudo xmutil listapps | grep -E "swiglu-x16|kria-accel"; grep -H . /sys/class/uio/*/name | grep swiglu; ls -la /dev/udmabuf0
echo ALL_DONE
