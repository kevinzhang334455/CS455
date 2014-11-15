; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"X\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @square(i32 %x) #0 {
  %1 = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = load i32* %1, align 4
  %4 = mul nsw i32 %2, %3
  %5 = add nsw i32 %4, 500
  %6 = sdiv i32 %5, 1000
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @complex_abs_squared(i32 %real, i32 %imag) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %real, i32* %1, align 4
  store i32 %imag, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = call i32 @square(i32 %3)
  %5 = load i32* %2, align 4
  %6 = call i32 @square(i32 %5)
  %7 = add nsw i32 %4, %6
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @check_for_bail(i32 %real, i32 %imag) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %real, i32* %2, align 4
  store i32 %imag, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = icmp sgt i32 %4, 4000
  br i1 %5, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %0
  br label %9

; <label>:6                                       ; preds = %0
  %7 = load i32* %3, align 4
  %8 = icmp sgt i32 %7, 4000
  br i1 %8, label %._crit_edge1, label %10

._crit_edge1:                                     ; preds = %6
  br label %9

; <label>:9                                       ; preds = %._crit_edge1, %._crit_edge
  store i32 0, i32* %1
  br label %17

; <label>:10                                      ; preds = %6
  %11 = load i32* %2, align 4
  %12 = load i32* %3, align 4
  %13 = call i32 @complex_abs_squared(i32 %11, i32 %12)
  %14 = icmp sgt i32 1600, %13
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %10
  store i32 0, i32* %1
  br label %17

; <label>:16                                      ; preds = %10
  store i32 1, i32* %1
  br label %17

; <label>:17                                      ; preds = %16, %15, %9
  %18 = load i32* %1
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define i32 @absval(i32 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %x, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = mul nsw i32 -1, %6
  store i32 %7, i32* %1
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4
  store i32 %9, i32* %1
  br label %10

; <label>:10                                      ; preds = %8, %5
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @checkpixel(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %real = alloca i32, align 4
  %imag = alloca i32, align 4
  %temp = alloca i32, align 4
  %iter = alloca i32, align 4
  %bail = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %x, i32* %2, align 4
  store i32 %y, i32* %3, align 4
  store i32 0, i32* %real, align 4
  store i32 0, i32* %imag, align 4
  store i32 0, i32* %iter, align 4
  store i32 16000, i32* %bail, align 4
  br label %4

; <label>:4                                       ; preds = %31, %0
  %5 = load i32* %iter, align 4
  %6 = icmp slt i32 %5, 255
  br i1 %6, label %7, label %34

; <label>:7                                       ; preds = %4
  %8 = load i32* %real, align 4
  %9 = call i32 @square(i32 %8)
  %10 = load i32* %imag, align 4
  %11 = call i32 @square(i32 %10)
  %12 = sub nsw i32 %9, %11
  %13 = load i32* %2, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, i32* %temp, align 4
  %15 = load i32* %real, align 4
  %16 = mul nsw i32 2, %15
  %17 = load i32* %imag, align 4
  %18 = mul nsw i32 %16, %17
  %19 = add nsw i32 %18, 500
  %20 = sdiv i32 %19, 1000
  %21 = load i32* %3, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, i32* %imag, align 4
  %23 = load i32* %temp, align 4
  store i32 %23, i32* %real, align 4
  %24 = load i32* %real, align 4
  %25 = call i32 @absval(i32 %24)
  %26 = load i32* %imag, align 4
  %27 = call i32 @absval(i32 %26)
  %28 = add nsw i32 %25, %27
  %29 = icmp sgt i32 %28, 5000
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %7
  store i32 0, i32* %1
  br label %35

; <label>:31                                      ; preds = %7
  %32 = load i32* %iter, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %iter, align 4
  br label %4

; <label>:34                                      ; preds = %4
  store i32 1, i32* %1
  br label %35

; <label>:35                                      ; preds = %34, %30
  %36 = load i32* %1
  ret i32 %36
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %on = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  store i32 950, i32* %y, align 4
  br label %2

; <label>:2                                       ; preds = %25, %0
  %3 = load i32* %y, align 4
  %4 = icmp sgt i32 %3, -950
  br i1 %4, label %5, label %29

; <label>:5                                       ; preds = %2
  store i32 -2100, i32* %x, align 4
  br label %6

; <label>:6                                       ; preds = %22, %5
  %7 = load i32* %x, align 4
  %8 = icmp slt i32 %7, 1000
  br i1 %8, label %9, label %25

; <label>:9                                       ; preds = %6
  %10 = load i32* %x, align 4
  %11 = load i32* %y, align 4
  %12 = call i32 @checkpixel(i32 %10, i32 %11)
  store i32 %12, i32* %on, align 4
  %13 = load i32* %on, align 4
  %14 = icmp eq i32 1, %13
  br i1 %14, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %9
  br label %17

; <label>:15                                      ; preds = %9
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  br label %17

; <label>:17                                      ; preds = %._crit_edge, %15
  %18 = load i32* %on, align 4
  %19 = icmp eq i32 0, %18
  br i1 %19, label %20, label %._crit_edge1

._crit_edge1:                                     ; preds = %17
  br label %22

; <label>:20                                      ; preds = %17
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %._crit_edge1, %20
  %23 = load i32* %x, align 4
  %24 = add nsw i32 %23, 40
  store i32 %24, i32* %x, align 4
  br label %6

; <label>:25                                      ; preds = %6
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %27 = load i32* %y, align 4
  %28 = sub nsw i32 %27, 50
  store i32 %28, i32* %y, align 4
  br label %2

; <label>:29                                      ; preds = %2
  %30 = load i32* %1
  ret i32 %30
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
