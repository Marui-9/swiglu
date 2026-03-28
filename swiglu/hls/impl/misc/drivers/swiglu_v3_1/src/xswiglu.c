// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xswiglu.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSwiglu_CfgInitialize(XSwiglu *InstancePtr, XSwiglu_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_BaseAddress = ConfigPtr->Ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSwiglu_Start(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_AP_CTRL) & 0x80;
    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSwiglu_IsDone(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSwiglu_IsIdle(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSwiglu_IsReady(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSwiglu_EnableAutoRestart(XSwiglu *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_AP_CTRL, 0x80);
}

void XSwiglu_DisableAutoRestart(XSwiglu *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_AP_CTRL, 0);
}

void XSwiglu_Set_W(XSwiglu *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_W_DATA, Data);
}

u32 XSwiglu_Get_W(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_W_DATA);
    return Data;
}

void XSwiglu_Set_V(XSwiglu *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_V_DATA, Data);
}

u32 XSwiglu_Get_V(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_V_DATA);
    return Data;
}

void XSwiglu_Set_W_down(XSwiglu *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_W_DOWN_DATA, Data);
}

u32 XSwiglu_Get_W_down(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_W_DOWN_DATA);
    return Data;
}

void XSwiglu_Set_x_batch(XSwiglu *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_X_BATCH_DATA, Data);
}

u32 XSwiglu_Get_x_batch(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_X_BATCH_DATA);
    return Data;
}

void XSwiglu_Set_out_batch(XSwiglu *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_OUT_BATCH_DATA, (u32)(Data));
    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_OUT_BATCH_DATA + 4, (u32)(Data >> 32));
}

u64 XSwiglu_Get_out_batch(XSwiglu *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_OUT_BATCH_DATA);
    Data += (u64)XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_OUT_BATCH_DATA + 4) << 32;
    return Data;
}

void XSwiglu_Set_down_quant_mode(XSwiglu *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_DOWN_QUANT_MODE_DATA, Data);
}

u32 XSwiglu_Get_down_quant_mode(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_DOWN_QUANT_MODE_DATA);
    return Data;
}

void XSwiglu_Set_x_scale(XSwiglu *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_X_SCALE_DATA, Data);
}

u32 XSwiglu_Get_x_scale(XSwiglu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_X_SCALE_DATA);
    return Data;
}

void XSwiglu_InterruptGlobalEnable(XSwiglu *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_GIE, 1);
}

void XSwiglu_InterruptGlobalDisable(XSwiglu *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_GIE, 0);
}

void XSwiglu_InterruptEnable(XSwiglu *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_IER);
    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_IER, Register | Mask);
}

void XSwiglu_InterruptDisable(XSwiglu *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_IER);
    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_IER, Register & (~Mask));
}

void XSwiglu_InterruptClear(XSwiglu *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSwiglu_WriteReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_ISR, Mask);
}

u32 XSwiglu_InterruptGetEnabled(XSwiglu *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_IER);
}

u32 XSwiglu_InterruptGetStatus(XSwiglu *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSwiglu_ReadReg(InstancePtr->Ctrl_BaseAddress, XSWIGLU_CTRL_ADDR_ISR);
}

