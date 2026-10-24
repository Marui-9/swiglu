#!/bin/bash
# KLD/PPL of the CPU and FPGA paths against the f16_q8_0 reference logits (generated on the
# PC, same llama.cpp commit 2cd20b72e, same wiki.test.raw, -c 256 --chunks 24).
#   Q4_K_M-fromf16q8: default Q4_K_M recipe (ffn_down Q6_K on layers 0,1,4,7,10,13,14,15),
#                     quantized from the same f16_q8_0 source as allQ4Kffn. The older
#                     "stock" LFM2.5-1.2B-Thinking-Q4_K_M.gguf (md5 d3cbb0bc...) is corrupt
#                     from blk.4 on and scores PPL 65536 (uniform over the vocabulary).
#   Q4_K_M-allQ4Kffn: the accelerator's GGUF, on the CPU and through the IP.
# Usage: kld_ref.sh [run ...]   (default: 2 3 4 5)
#   1  Q4_K_M-fromf16q8, CPU,  vs ref
#   2  allQ4Kffn,        CPU,  vs ref
#   3  allQ4Kffn,        FPGA, vs ref
#   4  allQ4Kffn,        CPU,  writes cpu_allq4k24.kld (24-chunk CPU base)
#   5  allQ4Kffn,        FPGA, vs cpu_allq4k24.kld (FPGA vs CPU directly)
B=~/llama.cpp/build/bin/llama-perplexity
M1=~/LFM2.5-1.2B-Thinking-Q4_K_M-fromf16q8.gguf
M=~/LFM2.5-1.2B-Thinking-Q4_K_M-allQ4Kffn.gguf
A="-f $HOME/wiki.test.raw -c 256 --chunks 24 -b 256 -ub 64 -t 4"
REF="--kl-divergence-base $HOME/ref_f16q8.kld --kl-divergence"
mkdir -p ~/kld_ref && cd ~/kld_ref
md5sum ~/ref_f16q8.kld ~/wiki.test.raw $M ~/llama.cpp/ggml/src/ggml-cpu/ggml-cpu.c
for r in ${@:-2 3 4 5}; do
  date
  case $r in
    1) $B -m $M1 $A $REF > cpu_q4km.log 2>&1 ;;
    2) $B -m $M $A $REF > cpu_allq4k.log 2>&1 ;;
    3) sudo env LLAMA_SWIHW=1 $B -m $M $A $REF > hw_allq4k.log 2>&1 ;;
    4) $B -m $M $A --kl-divergence-base cpu_allq4k24.kld > cpu_allq4k_base.log 2>&1 ;;
    5) sudo env LLAMA_SWIHW=1 $B -m $M $A --kl-divergence-base cpu_allq4k24.kld \
         --kl-divergence > hw_vs_cpu24.log 2>&1 ;;
  esac
  echo run${r}_exit=$?
done
date
md5sum cpu_allq4k24.kld 2>/dev/null
