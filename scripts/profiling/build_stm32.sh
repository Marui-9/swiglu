#!/bin/bash
# build_stm32.sh — release build of llama-bench for STM32MP257F-DK
# Usage: ./scripts/profiling/build_stm32.sh
# Run from ~/llama.cpp/

set -e

rm -rf build
cmake -B build -DCMAKE_BUILD_TYPE=Release -DGGML_NATIVE=ON
cmake --build build --target llama-bench -j2

echo "Build complete: build/bin/llama-bench"
