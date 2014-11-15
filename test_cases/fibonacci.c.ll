; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@array = common global [32 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [53 x i8] c"The first few digits of the Fibonacci sequence are:\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @initialize_array() #0 {
  %idx = alloca i32, align 4
  %bound = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 32, i32* %bound, align 4
  store i32 0, i32* %idx, align 4
  br label %1

; <label>:1                                       ; preds = %5, %0
  %2 = load i32* %idx, align 4
  %3 = load i32* %bound, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %1
  %6 = load i32* %idx, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [32 x i32]* @array, i32 0, i64 %7
  store i32 -1, i32* %8, align 4
  %9 = load i32* %idx, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %idx, align 4
  br label %1

; <label>:11                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @fib(i32 %val) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %val, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1
  br label %28

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [32 x i32]* @array, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %23

; <label>:12                                      ; preds = %6
  %13 = load i32* %2, align 4
  %14 = sub nsw i32 %13, 1
  %15 = call i32 @fib(i32 %14)
  %16 = load i32* %2, align 4
  %17 = sub nsw i32 %16, 2
  %18 = call i32 @fib(i32 %17)
  %19 = add nsw i32 %15, %18
  %20 = load i32* %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [32 x i32]* @array, i32 0, i64 %21
  store i32 %19, i32* %22, align 4
  br label %23

; <label>:23                                      ; preds = %._crit_edge, %12
  %24 = load i32* %2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [32 x i32]* @array, i32 0, i64 %25
  %27 = load i32* %26, align 4
  store i32 %27, i32* %1
  br label %28

; <label>:28                                      ; preds = %23, %5
  %29 = load i32* %1
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %idx = alloca i32, align 4
  %bound = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  store i32 32, i32* %bound, align 4
  call void @initialize_array()
  store i32 0, i32* %idx, align 4
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str, i32 0, i32 0))
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %idx, align 4
  %5 = load i32* %bound, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %3
  %8 = load i32* %idx, align 4
  %9 = call i32 @fib(i32 %8)
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %11 = load i32* %idx, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %idx, align 4
  br label %3

; <label>:13                                      ; preds = %3
  %14 = load i32* %1
  ret i32 %14
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
