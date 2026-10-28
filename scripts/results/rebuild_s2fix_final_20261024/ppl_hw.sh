#!/bin/bash
# HW perplexity/KLD of the s2fix bitstream against the rebuild_x16 run's CPU base
# (~/ppl16_cpu.kld, ../rebuild_x16_20261023/ppl_cmp.sh): same GGUF, same arguments, T2.
M=~/LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf
B=~/llama.cpp/build/bin/llama-perplexity
A="-m $M -f $HOME/wiki.test.raw -c 256 --chunks 6 -b 256 -ub 64 -t 2"
md5sum ~/ppl16_cpu.kld $M
sudo env LLAMA_SWIHW=1 $B $A --kl-divergence-base ~/ppl16_cpu.kld --kl-divergence > ~/s2fix/ppl_hw.log 2>&1; echo hw_exit=$?
