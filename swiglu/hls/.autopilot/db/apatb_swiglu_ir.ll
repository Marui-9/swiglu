; ModuleID = 'C:/Users/Jacob/Desktop/Vitis_projects/swiglu/swiglu/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_swiglu_ir(i8* noalias nocapture nonnull readonly "maxi" %W, i8* noalias nocapture nonnull readonly "maxi" %V, i8* noalias nocapture nonnull readonly "maxi" %W_down, i8* noalias nocapture nonnull readonly "maxi" %x_batch, float* noalias nocapture nonnull "maxi" %out_batch, i32 %down_quant_mode, float %x_scale) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %W to [9437184 x i8]*
  %1 = call i8* @malloc(i64 9437184)
  %W_copy = bitcast i8* %1 to [9437184 x i8]*
  %2 = bitcast i8* %V to [9437184 x i8]*
  %3 = call i8* @malloc(i64 9437184)
  %V_copy = bitcast i8* %3 to [9437184 x i8]*
  %4 = bitcast i8* %W_down to [13762560 x i8]*
  %5 = call i8* @malloc(i64 13762560)
  %W_down_copy = bitcast i8* %5 to [13762560 x i8]*
  %6 = bitcast i8* %x_batch to [8192 x i8]*
  %7 = call i8* @malloc(i64 8192)
  %x_batch_copy = bitcast i8* %7 to [8192 x i8]*
  %8 = bitcast float* %out_batch to [8192 x float]*
  %9 = call i8* @malloc(i64 32768)
  %out_batch_copy = bitcast i8* %9 to [8192 x float]*
  call fastcc void @copy_in([9437184 x i8]* nonnull %0, [9437184 x i8]* %W_copy, [9437184 x i8]* nonnull %2, [9437184 x i8]* %V_copy, [13762560 x i8]* nonnull %4, [13762560 x i8]* %W_down_copy, [8192 x i8]* nonnull %6, [8192 x i8]* %x_batch_copy, [8192 x float]* nonnull %8, [8192 x float]* %out_batch_copy)
  call void @apatb_swiglu_hw([9437184 x i8]* %W_copy, [9437184 x i8]* %V_copy, [13762560 x i8]* %W_down_copy, i8* %7, [8192 x float]* %out_batch_copy, i32 %down_quant_mode, float %x_scale)
  call void @copy_back([9437184 x i8]* %0, [9437184 x i8]* %W_copy, [9437184 x i8]* %2, [9437184 x i8]* %V_copy, [13762560 x i8]* %4, [13762560 x i8]* %W_down_copy, [8192 x i8]* %6, [8192 x i8]* %x_batch_copy, [8192 x float]* %8, [8192 x float]* %out_batch_copy)
  tail call void @free(i8* %1)
  tail call void @free(i8* %3)
  tail call void @free(i8* %5)
  tail call void @free(i8* %7)
  tail call void @free(i8* %9)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([9437184 x i8]* readonly, [9437184 x i8]*, [9437184 x i8]* readonly, [9437184 x i8]*, [13762560 x i8]* readonly, [13762560 x i8]*, [8192 x i8]* readonly, [8192 x i8]*, [8192 x float]* readonly, [8192 x float]*) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a9437184i8([9437184 x i8]* %1, [9437184 x i8]* %0)
  call fastcc void @onebyonecpy_hls.p0a9437184i8([9437184 x i8]* %3, [9437184 x i8]* %2)
  call fastcc void @onebyonecpy_hls.p0a13762560i8([13762560 x i8]* %5, [13762560 x i8]* %4)
  call fastcc void @onebyonecpy_hls.p0a8192i8([8192 x i8]* %7, [8192 x i8]* %6)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %9, [8192 x float]* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a9437184i8([9437184 x i8]* %dst, [9437184 x i8]* readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [9437184 x i8]* %dst, null
  %1 = icmp eq [9437184 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a9437184i8([9437184 x i8]* nonnull %dst, [9437184 x i8]* nonnull %src, i64 9437184)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a9437184i8([9437184 x i8]* %dst, [9437184 x i8]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [9437184 x i8]* %src, null
  %1 = icmp eq [9437184 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [9437184 x i8], [9437184 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [9437184 x i8], [9437184 x i8]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i8, i8* %src.addr, align 1
  store i8 %3, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a13762560i8([13762560 x i8]* %dst, [13762560 x i8]* readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [13762560 x i8]* %dst, null
  %1 = icmp eq [13762560 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a13762560i8([13762560 x i8]* nonnull %dst, [13762560 x i8]* nonnull %src, i64 13762560)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a13762560i8([13762560 x i8]* %dst, [13762560 x i8]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [13762560 x i8]* %src, null
  %1 = icmp eq [13762560 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [13762560 x i8], [13762560 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [13762560 x i8], [13762560 x i8]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i8, i8* %src.addr, align 1
  store i8 %3, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a8192i8([8192 x i8]* %dst, [8192 x i8]* readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [8192 x i8]* %dst, null
  %1 = icmp eq [8192 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a8192i8([8192 x i8]* nonnull %dst, [8192 x i8]* nonnull %src, i64 8192)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a8192i8([8192 x i8]* %dst, [8192 x i8]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [8192 x i8]* %src, null
  %1 = icmp eq [8192 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [8192 x i8], [8192 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [8192 x i8], [8192 x i8]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i8, i8* %src.addr, align 1
  store i8 %3, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %dst, [8192 x float]* readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [8192 x float]* %dst, null
  %1 = icmp eq [8192 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a8192f32([8192 x float]* nonnull %dst, [8192 x float]* nonnull %src, i64 8192)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a8192f32([8192 x float]* %dst, [8192 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [8192 x float]* %src, null
  %1 = icmp eq [8192 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [8192 x float], [8192 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [8192 x float], [8192 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([9437184 x i8]*, [9437184 x i8]* readonly, [9437184 x i8]*, [9437184 x i8]* readonly, [13762560 x i8]*, [13762560 x i8]* readonly, [8192 x i8]*, [8192 x i8]* readonly, [8192 x float]*, [8192 x float]* readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a9437184i8([9437184 x i8]* %0, [9437184 x i8]* %1)
  call fastcc void @onebyonecpy_hls.p0a9437184i8([9437184 x i8]* %2, [9437184 x i8]* %3)
  call fastcc void @onebyonecpy_hls.p0a13762560i8([13762560 x i8]* %4, [13762560 x i8]* %5)
  call fastcc void @onebyonecpy_hls.p0a8192i8([8192 x i8]* %6, [8192 x i8]* %7)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %8, [8192 x float]* %9)
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

declare void @apatb_swiglu_hw([9437184 x i8]*, [9437184 x i8]*, [13762560 x i8]*, i8*, [8192 x float]*, i32, float)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([9437184 x i8]*, [9437184 x i8]* readonly, [9437184 x i8]*, [9437184 x i8]* readonly, [13762560 x i8]*, [13762560 x i8]* readonly, [8192 x i8]*, [8192 x i8]* readonly, [8192 x float]*, [8192 x float]* readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %8, [8192 x float]* %9)
  ret void
}

declare void @swiglu_hw_stub(i8* noalias nocapture nonnull readonly, i8* noalias nocapture nonnull readonly, i8* noalias nocapture nonnull readonly, i8* noalias nocapture nonnull readonly, float* noalias nocapture nonnull, i32, float)

define void @swiglu_hw_stub_wrapper([9437184 x i8]*, [9437184 x i8]*, [13762560 x i8]*, i8*, [8192 x float]*, i32, float) #5 {
entry:
  %7 = bitcast i8* %3 to [8192 x i8]*
  call void @copy_out([9437184 x i8]* null, [9437184 x i8]* %0, [9437184 x i8]* null, [9437184 x i8]* %1, [13762560 x i8]* null, [13762560 x i8]* %2, [8192 x i8]* null, [8192 x i8]* %7, [8192 x float]* null, [8192 x float]* %4)
  %8 = bitcast [9437184 x i8]* %0 to i8*
  %9 = bitcast [9437184 x i8]* %1 to i8*
  %10 = bitcast [13762560 x i8]* %2 to i8*
  %11 = bitcast [8192 x i8]* %7 to i8*
  %12 = bitcast [8192 x float]* %4 to float*
  call void @swiglu_hw_stub(i8* %8, i8* %9, i8* %10, i8* %11, float* %12, i32 %5, float %6)
  call void @copy_in([9437184 x i8]* null, [9437184 x i8]* %0, [9437184 x i8]* null, [9437184 x i8]* %1, [13762560 x i8]* null, [13762560 x i8]* %2, [8192 x i8]* null, [8192 x i8]* %7, [8192 x float]* null, [8192 x float]* %4)
  ret void
}

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
