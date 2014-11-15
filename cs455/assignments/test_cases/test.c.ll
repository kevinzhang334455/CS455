; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, %struct.node* }

@main.v = private unnamed_addr constant %struct.node { i32 1, %struct.node* null }, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %v = alloca %struct.node, align 8
  %b = alloca i32, align 4
  %1 = alloca i8*
  %"reg2mem alloca point" = bitcast i32 0 to i32
  %2 = bitcast %struct.node* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.node* @main.v to i8*), i64 16, i32 8, i1 false)
  %3 = getelementptr inbounds %struct.node* %v, i32 0, i32 0
  store i32 2, i32* %3, align 4
  store i32 5, i32* %b, align 4
  %4 = load i32* %b, align 4
  %5 = zext i32 %4 to i64
  %6 = call i8* @llvm.stacksave()
  store i8* %6, i8** %1
  %7 = alloca i32, i64 %5, align 16
  %8 = load i32* %b, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i32* %7, i64 %9
  store i32 3, i32* %10, align 4
  %11 = load i8** %1
  call void @llvm.stackrestore(i8* %11)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) #1

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
