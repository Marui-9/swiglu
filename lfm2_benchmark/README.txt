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

2. The LFM2.5-1.2B-Thinking model in Q4_K_M format

   Download from HuggingFace:
   https://huggingface.co/LiquidAI/LFM2.5-1.2B-Thinking

   Place the .gguf file in this folder, or pass its path as an argument.

Instructions
------------

  1. Place the model file in this folder (or note its location).

  2. Run the script:

       chmod +x run_benchmark.sh
       ./run_benchmark.sh [path/to/model.gguf]

     If you skip the argument, it looks for:
       ./lfm2.5-1.2B-Q4_K.gguf

  3. Wait. Each thread count runs 10 repeats of 4 prompt + 64 generated
     tokens. On a quad-core ARM board this takes ~20--40 minutes total.

  4. Send back the four log files:

       lmf2_bench_T1_<timestamp>.log
       lmf2_bench_T2_<timestamp>.log
       lmf2_bench_T3_<timestamp>.log
       lmf2_bench_T4_<timestamp>.log

What it measures
----------------

  Throughput (tokens/s) for both prefill (4-token prompt) and decode
  (64-token generation), repeated 10 times per thread count.

  This is a standard CPU-only benchmark. No GPU, no custom kernels,
  no hardware acceleration — just llama.cpp on CPU.

Questions
---------

  Contact: <your email here>
