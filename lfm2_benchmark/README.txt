LFM2.5-1.2B CPU Benchmark
=========================

This folder benchmarks the LFM2.5-1.2B language model on your CPU using
llama.cpp. It produces four log files (T1--T4) that capture throughput
(tokens/s) on your hardware.

Requirements
------------

1. llama.cpp with llama-bench compiled

   If you already have llama.cpp installed, make sure the run_benchmark.sh
   script can find it. It checks these locations in order:
     ./llama.cpp/build/bin/llama-bench
     ./build/bin/llama-bench
     ~/llama.cpp/build/bin/llama-bench
     (your PATH)

   If you don't have it:

     git clone https://github.com/ggml-org/llama.cpp
     cd llama.cpp
     mkdir build && cd build
     cmake .. -DCMAKE_BUILD_TYPE=Release
     make -j llama-bench

2. The LFM2.5-1.2B-Thinking model in Q4_K_M (ggml k-quant) format

   Download the .gguf file from HuggingFace:
   https://huggingface.co/LiquidAI/LFM2.5-1.2B-Thinking-GGUF/blob/main/LFM2.5-1.2B-Thinking-Q4_K_M.gguf

   Look for a file with Q4_K_M in its name (e.g., *q4_k_m.gguf).
   Rename it or pass its path as an argument when running the script.

Instructions
------------

  1. Place the model file in this folder (or note its location).

  2. Run the script:

       chmod +x run_benchmark.sh
       ./run_benchmark.sh [path/to/model.gguf]

     If you skip the argument, it looks for:
       ./lfm2.5-1.2B-Q4_K.gguf

  3. Each thread count runs 10 repeats of 4 prompt + 64 generated
     tokens. On a quad-core ARM board this takes ~20--40 minutes total.

  4. Send back the four log files:

       lmf2_bench_T1_<timestamp>.log
       lmf2_bench_T2_<timestamp>.log
       lmf2_bench_T3_<timestamp>.log
       lmf2_bench_T4_<timestamp>.log


