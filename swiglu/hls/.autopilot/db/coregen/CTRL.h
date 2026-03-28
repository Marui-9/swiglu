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
//        bit 7~0 - W[7:0] (Read/Write)
//        others  - reserved
// 0x14 : reserved
// 0x18 : Data signal of V
//        bit 7~0 - V[7:0] (Read/Write)
//        others  - reserved
// 0x1c : reserved
// 0x20 : Data signal of W_down
//        bit 7~0 - W_down[7:0] (Read/Write)
//        others  - reserved
// 0x24 : reserved
// 0x28 : Data signal of x_batch
//        bit 7~0 - x_batch[7:0] (Read/Write)
//        others  - reserved
// 0x2c : reserved
// 0x30 : Data signal of out_batch
//        bit 31~0 - out_batch[31:0] (Read/Write)
// 0x34 : Data signal of out_batch
//        bit 31~0 - out_batch[63:32] (Read/Write)
// 0x38 : reserved
// 0x3c : Data signal of down_quant_mode
//        bit 31~0 - down_quant_mode[31:0] (Read/Write)
// 0x40 : reserved
// 0x44 : Data signal of x_scale
//        bit 31~0 - x_scale[31:0] (Read/Write)
// 0x48 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CTRL_ADDR_AP_CTRL              0x00
#define CTRL_ADDR_GIE                  0x04
#define CTRL_ADDR_IER                  0x08
#define CTRL_ADDR_ISR                  0x0c
#define CTRL_ADDR_W_DATA               0x10
#define CTRL_BITS_W_DATA               8
#define CTRL_ADDR_V_DATA               0x18
#define CTRL_BITS_V_DATA               8
#define CTRL_ADDR_W_DOWN_DATA          0x20
#define CTRL_BITS_W_DOWN_DATA          8
#define CTRL_ADDR_X_BATCH_DATA         0x28
#define CTRL_BITS_X_BATCH_DATA         8
#define CTRL_ADDR_OUT_BATCH_DATA       0x30
#define CTRL_BITS_OUT_BATCH_DATA       64
#define CTRL_ADDR_DOWN_QUANT_MODE_DATA 0x3c
#define CTRL_BITS_DOWN_QUANT_MODE_DATA 32
#define CTRL_ADDR_X_SCALE_DATA         0x44
#define CTRL_BITS_X_SCALE_DATA         32
