#!/bin/bash
set -euo pipefail

LLAMA_SRC=/home/ubuntu/llama.cpp
PATCH_DIR=/media/ubuntu/462C-969E/kria/llama-mods
TARGET="${LLAMA_SRC}/ggml/src/ggml-cpu/ggml-cpu.c"

echo "[1] Update ggml sources"
cp -v "${PATCH_DIR}/ggml-cpu.c" "${TARGET}"
touch "${TARGET}"   # ensure cmake sees a newer mtime even if content matches
echo "  src md5: $(md5sum ${PATCH_DIR}/ggml-cpu.c | awk '{print $1}')"
echo "  dst md5: $(md5sum ${TARGET} | awk '{print $1}')"

echo "[2] Rebuild llama-bench"
cd "${LLAMA_SRC}"
cmake --build build --config Release --target llama-bench -j4
