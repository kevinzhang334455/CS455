; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"Give me a number: \00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"I need a positive integer.\0A\00", align 1
@.str5 = private unnamed_addr constant [31 x i8] c"The binary representation of: \00", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str7 = private unnamed_addr constant [5 x i8] c"is: \00", align 1
@.str8 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @recursedigit(i32 %n) #0 {
  %1 = alloca i32, align 4
  %on = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp eq i32 0, %2
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %25

; <label>:5                                       ; preds = %0
  store i32 0, i32* %on, align 4
  %6 = load i32* %1, align 4
  %7 = load i32* %1, align 4
  %8 = sdiv i32 %7, 2
  %9 = mul nsw i32 %8, 2
  %10 = sub nsw i32 %6, %9
  %11 = icmp ne i32 0, %10
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %5
  br label %13

; <label>:12                                      ; preds = %5
  store i32 1, i32* %on, align 4
  br label %13

; <label>:13                                      ; preds = %._crit_edge, %12
  %14 = load i32* %1, align 4
  %15 = sdiv i32 %14, 2
  call void @recursedigit(i32 %15)
  %16 = load i32* %on, align 4
  %17 = icmp eq i32 0, %16
  br i1 %17, label %18, label %._crit_edge1

._crit_edge1:                                     ; preds = %13
  br label %20

; <label>:18                                      ; preds = %13
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  br label %20

; <label>:20                                      ; preds = %._crit_edge1, %18
  %21 = load i32* %on, align 4
  %22 = icmp eq i32 1, %21
  br i1 %22, label %23, label %._crit_edge2

._crit_edge2:                                     ; preds = %20
  br label %25

; <label>:23                                      ; preds = %20
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %25

; <label>:25                                      ; preds = %._crit_edge2, %23, %4
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  store i32 0, i32* %a, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32* %a, align 4
  %4 = icmp sge i32 0, %3
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0))
  %7 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32* %a)
  %8 = load i32* %a, align 4
  %9 = icmp sge i32 0, %8
  br i1 %9, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %5
  br label %12

; <label>:10                                      ; preds = %5
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i32 0, i32 0))
  br label %12

; <label>:12                                      ; preds = %._crit_edge, %10
  br label %2

; <label>:13                                      ; preds = %2
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str5, i32 0, i32 0))
  %15 = load i32* %a, align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i32 %15)
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str7, i32 0, i32 0))
  %18 = load i32* %a, align 4
  call void @recursedigit(i32 %18)
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0))
  %20 = load i32* %1
  ret i32 %20
}

declare i32 @__isoc99_scanf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
