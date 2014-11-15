; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@magic = global i32 35, align 4
@nbr_5 = common global [5 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1 = private unnamed_addr constant [45 x i8] c"I need a non-negative number less than 100: \00", align 1
@V = common global [100 x i32] zeroinitializer, align 16
@.str2 = private unnamed_addr constant [56 x i8] c"Please input the size of the vector to be transformed: \00", align 1
@.str3 = private unnamed_addr constant [18 x i8] c"Original vector:\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str6 = private unnamed_addr constant [21 x i8] c"Moving edge vector:\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init_nbr() #0 {
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 -3, i32* getelementptr inbounds ([5 x i32]* @nbr_5, i32 0, i64 0), align 4
  store i32 12, i32* getelementptr inbounds ([5 x i32]* @nbr_5, i32 0, i64 1), align 4
  store i32 17, i32* getelementptr inbounds ([5 x i32]* @nbr_5, i32 0, i64 2), align 4
  store i32 12, i32* getelementptr inbounds ([5 x i32]* @nbr_5, i32 0, i64 3), align 4
  store i32 -3, i32* getelementptr inbounds ([5 x i32]* @nbr_5, i32 0, i64 4), align 4
  ret void
}

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
define void @moving(i32 %size) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %size, i32* %1, align 4
  store i32 2, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %36, %0
  %3 = load i32* %i, align 4
  %4 = load i32* %1, align 4
  %5 = sub nsw i32 %4, 2
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %39

; <label>:7                                       ; preds = %2
  store i32 0, i32* %temp, align 4
  store i32 -2, i32* %j, align 4
  br label %8

; <label>:8                                       ; preds = %26, %7
  %9 = load i32* %j, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %29

; <label>:11                                      ; preds = %8
  %12 = load i32* %i, align 4
  %13 = load i32* %j, align 4
  %14 = add nsw i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x i32]* @V, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = load i32* %j, align 4
  %19 = add nsw i32 %18, 2
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5 x i32]* @nbr_5, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = mul nsw i32 %17, %22
  %24 = load i32* %temp, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, i32* %temp, align 4
  br label %26

; <label>:26                                      ; preds = %11
  %27 = load i32* %j, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %j, align 4
  br label %8

; <label>:29                                      ; preds = %8
  %30 = load i32* %temp, align 4
  %31 = load i32* @magic, align 4
  %32 = sdiv i32 %30, %31
  %33 = load i32* %i, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x i32]* @V, i32 0, i64 %34
  store i32 %32, i32* %35, align 4
  br label %36

; <label>:36                                      ; preds = %29
  %37 = load i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %2

; <label>:39                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([56 x i8]* @.str2, i32 0, i32 0))
  %3 = call i32 @getinput()
  store i32 %3, i32* %size, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %14, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %size, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %17

; <label>:8                                       ; preds = %4
  %9 = call i32 @rand() #3
  %10 = srem i32 %9, 100
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [100 x i32]* @V, i32 0, i64 %12
  store i32 %10, i32* %13, align 4
  br label %14

; <label>:14                                      ; preds = %8
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %4

; <label>:17                                      ; preds = %4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str3, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %19

; <label>:19                                      ; preds = %29, %17
  %20 = load i32* %i, align 4
  %21 = load i32* %size, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %32

; <label>:23                                      ; preds = %19
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [100 x i32]* @V, i32 0, i64 %25
  %27 = load i32* %26, align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %27)
  br label %29

; <label>:29                                      ; preds = %23
  %30 = load i32* %i, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %i, align 4
  br label %19

; <label>:32                                      ; preds = %19
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0))
  call void @init_nbr()
  %34 = load i32* %size, align 4
  call void @moving(i32 %34)
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str6, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %36

; <label>:36                                      ; preds = %46, %32
  %37 = load i32* %i, align 4
  %38 = load i32* %size, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %49

; <label>:40                                      ; preds = %36
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x i32]* @V, i32 0, i64 %42
  %44 = load i32* %43, align 4
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %44)
  br label %46

; <label>:46                                      ; preds = %40
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %36

; <label>:49                                      ; preds = %36
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0))
  %51 = load i32* %1
  ret i32 %51
}

; Function Attrs: nounwind
declare i32 @rand() #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
