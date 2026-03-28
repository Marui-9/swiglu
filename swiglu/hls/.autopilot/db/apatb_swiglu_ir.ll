; ModuleID = 'C:/Users/Jacob/Desktop/Vitis_projects/swiglu/swiglu/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_swiglu_ir(i8* noalias nocapture nonnull readonly %W, i8* noalias nocapture nonnull readonly %V, i8* noalias nocapture nonnull readonly %W_down, i8* noalias nocapture nonnull readonly %x_batch, float* noalias nocapture nonnull "maxi" %out_batch, i32 %down_quant_mode, float %x_scale) local_unnamed_addr #0 {
entry:
  %W_copy = alloca i8, align 512
  %V_copy = alloca i8, align 512
  %W_down_copy = alloca i8, align 512
  %x_batch_copy = alloca i8, align 512
  %0 = bitcast float* %out_batch to [2048 x float]*
  %1 = call i8* @malloc(i64 8192)
  %out_batch_copy = bitcast i8* %1 to [2048 x float]*
  call fastcc void @copy_in(i8* nonnull %W, i8* nonnull align 512 %W_copy, i8* nonnull %V, i8* nonnull align 512 %V_copy, i8* nonnull %W_down, i8* nonnull align 512 %W_down_copy, i8* nonnull %x_batch, i8* nonnull align 512 %x_batch_copy, [2048 x float]* nonnull %0, [2048 x float]* %out_batch_copy)
  call void @apatb_swiglu_hw(i8* %W_copy, i8* %V_copy, i8* %W_down_copy, i8* %x_batch_copy, [2048 x float]* %out_batch_copy, i32 %down_quant_mode, float %x_scale)
  call void @copy_back(i8* %W, i8* %W_copy, i8* %V, i8* %V_copy, i8* %W_down, i8* %W_down_copy, i8* %x_batch, i8* %x_batch_copy, [2048 x float]* %0, [2048 x float]* %out_batch_copy)
  tail call void @free(i8* %1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(i8* readonly, i8* align 512, i8* readonly, i8* align 512, i8* readonly, i8* align 512, i8* readonly, i8* align 512, [2048 x float]* readonly, [2048 x float]*) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %1, i8* %0)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %3, i8* %2)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %5, i8* %4)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %7, i8* %6)
  call fastcc void @onebyonecpy_hls.p0a2048f32([2048 x float]* %9, [2048 x float]* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %dst, i8* readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq i8* %dst, null
  %1 = icmp eq i8* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = load i8, i8* %src, align 1
  store i8 %3, i8* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a2048f32([2048 x float]* %dst, [2048 x float]* readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [2048 x float]* %dst, null
  %1 = icmp eq [2048 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2048f32([2048 x float]* nonnull %dst, [2048 x float]* nonnull %src, i64 2048)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2048f32([2048 x float]* %dst, [2048 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [2048 x float]* %src, null
  %1 = icmp eq [2048 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2048 x float], [2048 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2048 x float], [2048 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out(i8*, i8* readonly align 512, i8*, i8* readonly align 512, i8*, i8* readonly align 512, i8*, i8* readonly align 512, [2048 x float]*, [2048 x float]* readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0i8(i8* %0, i8* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %2, i8* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %4, i8* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %6, i8* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a2048f32([2048 x float]* %8, [2048 x float]* %9)
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

declare void @apatb_swiglu_hw(i8*, i8*, i8*, i8*, [2048 x float]*, i32, float)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(i8*, i8* readonly align 512, i8*, i8* readonly align 512, i8*, i8* readonly align 512, i8*, i8* readonly align 512, [2048 x float]*, [2048 x float]* readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2048f32([2048 x float]* %8, [2048 x float]* %9)
  ret void
}

declare void @swiglu_hw_stub(i8* noalias nocapture nonnull readonly, i8* noalias nocapture nonnull readonly, i8* noalias nocapture nonnull readonly, i8* noalias nocapture nonnull readonly, float* noalias nocapture nonnull, i32, float)

define void @swiglu_hw_stub_wrapper(i8*, i8*, i8*, i8*, [2048 x float]*, i32, float) #5 {
entry:
  call void @copy_out(i8* null, i8* %0, i8* null, i8* %1, i8* null, i8* %2, i8* null, i8* %3, [2048 x float]* null, [2048 x float]* %4)
  %7 = bitcast [2048 x float]* %4 to float*
  call void @swiglu_hw_stub(i8* %0, i8* %1, i8* %2, i8* %3, float* %7, i32 %5, float %6)
  call void @copy_in(i8* null, i8* %0, i8* null, i8* %1, i8* null, i8* %2, i8* null, i8* %3, [2048 x float]* null, [2048 x float]* %4)
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
