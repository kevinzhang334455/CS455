; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1 = private unnamed_addr constant [45 x i8] c"I need a non-negative number less than 100: \00", align 1
@.str2 = private unnamed_addr constant [55 x i8] c"Please give the size of the vectors to be multiplied: \00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"0\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @getinput() #0 {
  %a = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 -1, i32* %a, align 4
  br label %1

; <label>:1                                       ; preds = %13, %0
  %2 = load i32* %a, align 4
  %3 = icmp sgt i32 0, %2
  br i1 %3, label %4, label %14

; <label>:4                                       ; preds = %1
  %5 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32* %a)
  %6 = load i32* %a, align 4
  %7 = icmp sgt i32 0, %6
  br i1 %7, label %._crit_edge, label %8

._crit_edge:                                      ; preds = %4
  br label %11

; <label>:8                                       ; preds = %4
  %9 = load i32* %a, align 4
  %10 = icmp sgt i32 %9, 100
  br i1 %10, label %._crit_edge1, label %._crit_edge2

._crit_edge2:                                     ; preds = %8
  br label %13

._crit_edge1:                                     ; preds = %8
  br label %11

; <label>:11                                      ; preds = %._crit_edge1, %._crit_edge
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str1, i32 0, i32 0))
  store i32 -1, i32* %a, align 4
  br label %13

; <label>:13                                      ; preds = %._crit_edge2, %11
  br label %1

; <label>:14                                      ; preds = %1
  %15 = load i32* %a, align 4
  ret i32 %15
}

declare i32 @__isoc99_scanf(i8*, ...) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %A = alloca [100 x i32], align 16
  %B = alloca [100 x i32], align 16
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %result = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str2, i32 0, i32 0))
  %3 = call i32 @getinput()
  store i32 %3, i32* %size, align 4
  %4 = getelementptr inbounds [100 x i32]* %A, i32 0, i64 0
  store i32 0, i32* %4, align 4
  store i32 1, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %22, %0
  %6 = load i32* %i, align 4
  %7 = load i32* %size, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %25

; <label>:9                                       ; preds = %5
  %10 = load i32* %i, align 4
  %11 = sub nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [100 x i32]* %A, i32 0, i64 %12
  %14 = load i32* %13, align 4
  %15 = load i32* %i, align 4
  %16 = load i32* %i, align 4
  %17 = mul nsw i32 %15, %16
  %18 = add nsw i32 %14, %17
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x i32]* %A, i32 0, i64 %20
  store i32 %18, i32* %21, align 4
  br label %22

; <label>:22                                      ; preds = %9
  %23 = load i32* %i, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %i, align 4
  br label %5

; <label>:25                                      ; preds = %5
  %26 = getelementptr inbounds [100 x i32]* %B, i32 0, i64 0
  store i32 0, i32* %26, align 4
  store i32 1, i32* %i, align 4
  br label %27

; <label>:27                                      ; preds = %42, %25
  %28 = load i32* %i, align 4
  %29 = load i32* %size, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %45

; <label>:31                                      ; preds = %27
  %32 = load i32* %i, align 4
  %33 = load i32* %i, align 4
  %34 = sub nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [100 x i32]* %B, i32 0, i64 %35
  %37 = load i32* %36, align 4
  %38 = add nsw i32 %32, %37
  %39 = load i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [100 x i32]* %B, i32 0, i64 %40
  store i32 %38, i32* %41, align 4
  br label %42

; <label>:42                                      ; preds = %31
  %43 = load i32* %i, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %i, align 4
  br label %27

; <label>:45                                      ; preds = %27
  store i32 0, i32* %result, align 4
  store i32 0, i32* %i, align 4
  br label %46

; <label>:46                                      ; preds = %62, %45
  %47 = load i32* %i, align 4
  %48 = load i32* %size, align 4
  %49 = icmp slt i32 %47, %48
  br i1 %49, label %50, label %65

; <label>:50                                      ; preds = %46
  %51 = load i32* %i, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [100 x i32]* %A, i32 0, i64 %52
  %54 = load i32* %53, align 4
  %55 = load i32* %i, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [100 x i32]* %B, i32 0, i64 %56
  %58 = load i32* %57, align 4
  %59 = mul nsw i32 %54, %58
  %60 = load i32* %result, align 4
  %61 = add nsw i32 %60, %59
  store i32 %61, i32* %result, align 4
  br label %62

; <label>:62                                      ; preds = %50
  %63 = load i32* %i, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %i, align 4
  br label %46

; <label>:65                                      ; preds = %46
  %66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  %67 = load i32* %1
  ret i32 %67
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
