// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XSWIGLU_H
#define XSWIGLU_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xswiglu_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Ctrl_BaseAddress;
} XSwiglu_Config;
#endif

typedef struct {
    u64 Ctrl_BaseAddress;
    u32 IsReady;
} XSwiglu;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSwiglu_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSwiglu_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSwiglu_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSwiglu_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XSwiglu_Initialize(XSwiglu *InstancePtr, UINTPTR BaseAddress);
XSwiglu_Config* XSwiglu_LookupConfig(UINTPTR BaseAddress);
#else
int XSwiglu_Initialize(XSwiglu *InstancePtr, u16 DeviceId);
XSwiglu_Config* XSwiglu_LookupConfig(u16 DeviceId);
#endif
int XSwiglu_CfgInitialize(XSwiglu *InstancePtr, XSwiglu_Config *ConfigPtr);
#else
int XSwiglu_Initialize(XSwiglu *InstancePtr, const char* InstanceName);
int XSwiglu_Release(XSwiglu *InstancePtr);
#endif

void XSwiglu_Start(XSwiglu *InstancePtr);
u32 XSwiglu_IsDone(XSwiglu *InstancePtr);
u32 XSwiglu_IsIdle(XSwiglu *InstancePtr);
u32 XSwiglu_IsReady(XSwiglu *InstancePtr);
void XSwiglu_EnableAutoRestart(XSwiglu *InstancePtr);
void XSwiglu_DisableAutoRestart(XSwiglu *InstancePtr);

void XSwiglu_Set_W(XSwiglu *InstancePtr, u64 Data);
u64 XSwiglu_Get_W(XSwiglu *InstancePtr);
void XSwiglu_Set_V(XSwiglu *InstancePtr, u64 Data);
u64 XSwiglu_Get_V(XSwiglu *InstancePtr);
void XSwiglu_Set_W_down(XSwiglu *InstancePtr, u64 Data);
u64 XSwiglu_Get_W_down(XSwiglu *InstancePtr);
void XSwiglu_Set_x_batch(XSwiglu *InstancePtr, u64 Data);
u64 XSwiglu_Get_x_batch(XSwiglu *InstancePtr);
void XSwiglu_Set_out_batch(XSwiglu *InstancePtr, u64 Data);
u64 XSwiglu_Get_out_batch(XSwiglu *InstancePtr);
void XSwiglu_Set_down_quant_mode(XSwiglu *InstancePtr, u32 Data);
u32 XSwiglu_Get_down_quant_mode(XSwiglu *InstancePtr);
void XSwiglu_Set_x_scale(XSwiglu *InstancePtr, u32 Data);
u32 XSwiglu_Get_x_scale(XSwiglu *InstancePtr);

void XSwiglu_InterruptGlobalEnable(XSwiglu *InstancePtr);
void XSwiglu_InterruptGlobalDisable(XSwiglu *InstancePtr);
void XSwiglu_InterruptEnable(XSwiglu *InstancePtr, u32 Mask);
void XSwiglu_InterruptDisable(XSwiglu *InstancePtr, u32 Mask);
void XSwiglu_InterruptClear(XSwiglu *InstancePtr, u32 Mask);
u32 XSwiglu_InterruptGetEnabled(XSwiglu *InstancePtr);
u32 XSwiglu_InterruptGetStatus(XSwiglu *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
