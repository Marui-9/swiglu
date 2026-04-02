// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xswiglu.h"

extern XSwiglu_Config XSwiglu_ConfigTable[];

#ifdef SDT
XSwiglu_Config *XSwiglu_LookupConfig(UINTPTR BaseAddress) {
	XSwiglu_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XSwiglu_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XSwiglu_ConfigTable[Index].Ctrl_BaseAddress == BaseAddress) {
			ConfigPtr = &XSwiglu_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSwiglu_Initialize(XSwiglu *InstancePtr, UINTPTR BaseAddress) {
	XSwiglu_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSwiglu_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSwiglu_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XSwiglu_Config *XSwiglu_LookupConfig(u16 DeviceId) {
	XSwiglu_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSWIGLU_NUM_INSTANCES; Index++) {
		if (XSwiglu_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSwiglu_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSwiglu_Initialize(XSwiglu *InstancePtr, u16 DeviceId) {
	XSwiglu_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSwiglu_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSwiglu_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

