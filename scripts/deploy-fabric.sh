#!/bin/bash
set -euo pipefail

# Paths
SRC_MNT=/media/ubuntu/462C-969E/kria
ACCEL_DIR=/home/ubuntu/Desktop/accel
LLAMA_SRC=/home/ubuntu/llama.cpp
FW_DIR=/lib/firmware/xilinx/kria-accel
UDMABUF_KO=/home/ubuntu/udmabuf/u-dma-buf.ko
UDMABUF_SIZE=671088640

echo "[0] set env vars LLAMA_SWIHW=1 & SWIGLU_DEBUG=1"
export LLAMA_SWIHW=1
export SWIGLU_DEBUG=1

echo "[1] Copy bit/dtsi sources"
cp -v "${SRC_MNT}/design_1_wrapper.bit.bin" "${SRC_MNT}/pl.dtsi" "${ACCEL_DIR}/"

echo "[2] Build DTBO"
cd "${ACCEL_DIR}"
dtc -@ -O dtb -o design_1_wrapper.dtbo pl.dtsi

echo "[3] Deploy firmware assets"
sudo cp -v design_1_wrapper.bit.bin design_1_wrapper.dtbo shell.json "${FW_DIR}/"

echo "[4] Ensure configfs mounted"
sudo mount -t configfs none /sys/kernel/config || true

echo "[5] Unload any existing app/overlay"
sudo xmutil unloadapp || true
sudo rmdir /sys/kernel/config/device-tree/overlays/kria-accel 2>/dev/null || true

echo "[6] Load app (programs bit & dtbo from shell.json)"
sudo xmutil loadapp kria-accel

echo "[7] Insert u-dma-buf (CMA must cover size)"
cd
cd ~/udmabuf && sudo insmod u-dma-buf.ko udmabuf0=671088640 || true
grep cma /proc/cmdline
cat /sys/class/u-dma-buf/udmabuf0/phys_addr
cat /sys/class/u-dma-buf/udmabuf0/size

echo "[8] UIO sanity check"
cat /sys/class/uio/uio*/maps/map0/addr
cat /sys/class/uio/uio*/maps/map0/name
