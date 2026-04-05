// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// CTRL
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of W
//        bit 31~0 - W[31:0] (Read/Write)
// 0x14 : Data signal of W
//        bit 31~0 - W[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of V
//        bit 31~0 - V[31:0] (Read/Write)
// 0x20 : Data signal of V
//        bit 31~0 - V[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of W_down
//        bit 31~0 - W_down[31:0] (Read/Write)
// 0x2c : Data signal of W_down
//        bit 31~0 - W_down[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of W_down2
//        bit 31~0 - W_down2[31:0] (Read/Write)
// 0x38 : Data signal of W_down2
//        bit 31~0 - W_down2[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of x_batch
//        bit 31~0 - x_batch[31:0] (Read/Write)
// 0x44 : Data signal of x_batch
//        bit 31~0 - x_batch[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of out_batch
//        bit 31~0 - out_batch[31:0] (Read/Write)
// 0x50 : Data signal of out_batch
//        bit 31~0 - out_batch[63:32] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of down_quant_mode
//        bit 31~0 - down_quant_mode[31:0] (Read/Write)
// 0x5c : reserved
// 0x60 : Data signal of x_scale
//        bit 31~0 - x_scale[31:0] (Read/Write)
// 0x64 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSWIGLU_CTRL_ADDR_AP_CTRL              0x00
#define XSWIGLU_CTRL_ADDR_GIE                  0x04
#define XSWIGLU_CTRL_ADDR_IER                  0x08
#define XSWIGLU_CTRL_ADDR_ISR                  0x0c
#define XSWIGLU_CTRL_ADDR_W_DATA               0x10
#define XSWIGLU_CTRL_BITS_W_DATA               64
#define XSWIGLU_CTRL_ADDR_V_DATA               0x1c
#define XSWIGLU_CTRL_BITS_V_DATA               64
#define XSWIGLU_CTRL_ADDR_W_DOWN_DATA          0x28
#define XSWIGLU_CTRL_BITS_W_DOWN_DATA          64
#define XSWIGLU_CTRL_ADDR_W_DOWN2_DATA         0x34
#define XSWIGLU_CTRL_BITS_W_DOWN2_DATA         64
#define XSWIGLU_CTRL_ADDR_X_BATCH_DATA         0x40
#define XSWIGLU_CTRL_BITS_X_BATCH_DATA         64
#define XSWIGLU_CTRL_ADDR_OUT_BATCH_DATA       0x4c
#define XSWIGLU_CTRL_BITS_OUT_BATCH_DATA       64
#define XSWIGLU_CTRL_ADDR_DOWN_QUANT_MODE_DATA 0x58
#define XSWIGLU_CTRL_BITS_DOWN_QUANT_MODE_DATA 32
#define XSWIGLU_CTRL_ADDR_X_SCALE_DATA         0x60
#define XSWIGLU_CTRL_BITS_X_SCALE_DATA         32

