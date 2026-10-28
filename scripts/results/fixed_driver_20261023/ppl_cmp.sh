#!/bin/bash
M=~/LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf
B=~/llama.cpp/build/bin/llama-perplexity
A="-m $M -f $HOME/wiki.test.raw -c 256 --chunks 6 -b 256 -ub 64 -t 2"
$B $A --kl-divergence-base ~/ppl_cpu.kld > ~/ppl_cpu.log 2>&1; echo cpu_exit=$?
sudo env LLAMA_SWIHW=1 $B $A --kl-divergence-base ~/ppl_cpu.kld --kl-divergence > ~/ppl_hw.log 2>&1; echo hw_exit=$?
