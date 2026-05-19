#!/bin/bash
set -euo pipefail

LLAMA_SRC=/home/ubuntu/llama.cpp
PATCH_DIR=/media/ubuntu/462C-969E/kria/llama-mods

echo "[1] Update ggml sources"
cp -v "${PATCH_DIR}/ggml-cpu.c" "${LLAMA_SRC}/ggml/src/ggml-cpu/ggml-cpu.c"
#cp -v "${PATCH_DIR}/ggml.h"     "${LLAMA_SRC}/ggml/include/ggml.h"
#cp -v "${PATCH_DIR}/ggml.c"     "${LLAMA_SRC}/ggml/src/ggml.c"

echo "[2] Rebuild llama-bench"

cd "${LLAMA_SRC}"
rm build/CmakeCache.txt
cmake --build build --config Release --target llama-bench -j4
