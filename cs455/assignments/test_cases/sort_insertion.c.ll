; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@data = common global [30 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [10 x i8] c"results:\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"%d: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @insertSort(i32 %lb, i32 %ub) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %.reg2mem = alloca i1
  %.reg2mem1 = alloca i1
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %lb, i32* %1, align 4
  store i32 %ub, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = add nsw i32 %3, 1
  store i32 %4, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %46, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %2, align 4
  %8 = icmp sle i32 %6, %7
  br i1 %8, label %9, label %49

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [30 x i32]* @data, i32 0, i64 %11
  %13 = load i32* %12, align 4
  store i32 %13, i32* %t, align 4
  %14 = load i32* %i, align 4
  %15 = sub nsw i32 %14, 1
  store i32 %15, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %37, %9
  %17 = load i32* %j, align 4
  %18 = load i32* %1, align 4
  %19 = icmp sge i32 %17, %18
  br i1 %19, label %20, label %._crit_edge

._crit_edge:                                      ; preds = %16
  store i1 false, i1* %.reg2mem1
  br label %27

; <label>:20                                      ; preds = %16
  %21 = load i32* %j, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [30 x i32]* @data, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = load i32* %t, align 4
  %26 = icmp sgt i32 %24, %25
  store i1 %26, i1* %.reg2mem
  %.reload = load i1* %.reg2mem
  store i1 %.reload, i1* %.reg2mem1
  br label %27

; <label>:27                                      ; preds = %._crit_edge, %20
  %.reload2 = load i1* %.reg2mem1
  br i1 %.reload2, label %28, label %40

; <label>:28                                      ; preds = %27
  %29 = load i32* %j, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [30 x i32]* @data, i32 0, i64 %30
  %32 = load i32* %31, align 4
  %33 = load i32* %j, align 4
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [30 x i32]* @data, i32 0, i64 %35
  store i32 %32, i32* %36, align 4
  br label %37

; <label>:37                                      ; preds = %28
  %38 = load i32* %j, align 4
  %39 = add nsw i32 %38, -1
  store i32 %39, i32* %j, align 4
  br label %16

; <label>:40                                      ; preds = %27
  %41 = load i32* %t, align 4
  %42 = load i32* %j, align 4
  %43 = add nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [30 x i32]* @data, i32 0, i64 %44
  store i32 %41, i32* %45, align 4
  br label %46

; <label>:46                                      ; preds = %40
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %5

; <label>:49                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define void @fill(i32 %lb, i32 %ub) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %lb, i32* %1, align 4
  store i32 %ub, i32* %2, align 4
  call void @srand(i32 1) #3
  %3 = load i32* %1, align 4
  store i32 %3, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %14, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %2, align 4
  %7 = icmp sle i32 %5, %6
  br i1 %7, label %8, label %17

; <label>:8                                       ; preds = %4
  %9 = call i32 @rand() #3
  %10 = srem i32 %9, 1000
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [30 x i32]* @data, i32 0, i64 %12
  store i32 %10, i32* %13, align 4
  br label %14

; <label>:14                                      ; preds = %8
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %4

; <label>:17                                      ; preds = %4
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %maxnum = alloca i32, align 4
  %lb = alloca i32, align 4
  %ub = alloca i32, align 4
  %i = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 30, i32* %maxnum, align 4
  store i32 0, i32* %lb, align 4
  %4 = load i32* %maxnum, align 4
  %5 = sub nsw i32 %4, 1
  store i32 %5, i32* %ub, align 4
  %6 = load i32* %lb, align 4
  %7 = load i32* %ub, align 4
  call void @fill(i32 %6, i32 %7)
  %8 = load i32* %lb, align 4
  %9 = load i32* %ub, align 4
  call void @insertSort(i32 %8, i32 %9)
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  %11 = load i32* %lb, align 4
  store i32 %11, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %23, %0
  %13 = load i32* %i, align 4
  %14 = load i32* %ub, align 4
  %15 = icmp sle i32 %13, %14
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %12
  %17 = load i32* %i, align 4
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [30 x i32]* @data, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %17, i32 %21)
  br label %23

; <label>:23                                      ; preds = %16
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %12

; <label>:26                                      ; preds = %12
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
