#!/bin/bash
# CPU-only llama-bench with the PL as dfx-mgr leaves it at boot (k26-starter-kits, never
# `xmutil loadapp` in this boot), then idle SOM power in that state and with swiglu-s2fix
# loaded. Services as in the 2026-10-24 bench: only ollama stopped.
D=~/cpu_noload
state() {
  echo "== state: $1  $(date -Is)"
  sudo xmutil listapps 2>/dev/null | awk '$NF ~ /^0/ {print "active app:", $1}'
  echo "fpga0: $(cat /sys/class/fpga_manager/fpga0/state)"
  echo "pl0_ref rate=$(sudo cat /sys/kernel/debug/clk/pl0_ref/clk_rate) enable=$(sudo cat /sys/kernel/debug/clk/pl0_ref/clk_enable_count)"
  snap services ollama | tail -1
  echo "loadavg: $(cat /proc/loadavg)"
}
settle() {  # wait for 1-min load < 0.30, at most 300 s
  t=0; while [ $t -lt 300 ]; do
    awk -v l=$(cut -d' ' -f1 /proc/loadavg) 'BEGIN{exit !(l<0.30)}' && break
    sleep 5; t=$((t+5)); done
  echo "settled after ${t}s, loadavg $(cat /proc/loadavg)"
}
sample() {  # 60 x 1 s SOM total power
  for i in $(seq 60); do
    sudo xmutil xlnx_platformstats -p | awk -F: '/SOM total power/{print $2+0}'; sleep 1
  done > $D/idle_$1.txt
  awk -v l=$1 '{s+=$1;n++;if(min==""||$1<min)min=$1;if($1>max)max=$1}
    END{printf "idle %s: n=%d mean=%.1f mW min=%d max=%d\n",l,n,s/n,min,max}' $D/idle_$1.txt
}
{
state boot_default; settle; sample boot_default
cd ~/llama.cpp
export LOG_DIR=$D
for T in 1 2 3 4; do ~/s2fix/run_profile_cpu.sh $T 10; sleep 20; done
state after_bench; settle; sample boot_default_after
sudo xmutil unloadapp; sudo xmutil loadapp swiglu-s2fix; sleep 30
state s2fix_loaded; settle; sample s2fix_loaded
echo ALL_DONE
} 2>&1
