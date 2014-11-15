; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@array_1 = common global [16 x i32] zeroinitializer, align 16
@array_2 = common global [16 x i32] zeroinitializer, align 16
@array_3 = common global [16 x i32] zeroinitializer, align 16
@array_4 = common global [16 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [10 x i8] c"Array_1:\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str2 = private unnamed_addr constant [11 x i8] c"\0AArray_2:\0A\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"\0AArray_3:\0A\00", align 1
@.str4 = private unnamed_addr constant [11 x i8] c"\0AArray_4:\0A\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @populate_arrays() #0 {
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 0), align 4
  store i32 15, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 0), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 0), align 4
  store i32 13, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 0), align 4
  store i32 1, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 1), align 4
  store i32 14, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 1), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 1), align 4
  store i32 9, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 1), align 4
  store i32 2, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 2), align 4
  store i32 13, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 2), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 2), align 4
  store i32 12, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 2), align 4
  store i32 3, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 3), align 4
  store i32 12, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 3), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 3), align 4
  store i32 1, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 3), align 4
  store i32 4, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 4), align 4
  store i32 11, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 4), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 4), align 4
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 4), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 5), align 4
  store i32 10, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 5), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 5), align 4
  store i32 14, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 5), align 4
  store i32 6, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 6), align 4
  store i32 9, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 6), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 6), align 4
  store i32 3, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 6), align 4
  store i32 7, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 7), align 4
  store i32 8, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 7), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 7), align 4
  store i32 2, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 7), align 4
  store i32 8, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 8), align 4
  store i32 7, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 8), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 8), align 4
  store i32 11, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 8), align 4
  store i32 9, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 9), align 4
  store i32 6, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 9), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 9), align 4
  store i32 8, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 9), align 4
  store i32 10, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 10), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 10), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 10), align 4
  store i32 6, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 10), align 4
  store i32 11, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 11), align 4
  store i32 4, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 11), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 11), align 4
  store i32 4, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 11), align 4
  store i32 12, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 12), align 4
  store i32 3, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 12), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 12), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 12), align 4
  store i32 13, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 13), align 4
  store i32 2, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 13), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 13), align 4
  store i32 10, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 13), align 4
  store i32 14, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 14), align 4
  store i32 1, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 14), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 14), align 4
  store i32 7, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 14), align 4
  store i32 15, i32* getelementptr inbounds ([16 x i32]* @array_1, i32 0, i64 15), align 4
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @array_2, i32 0, i64 15), align 4
  store i32 5, i32* getelementptr inbounds ([16 x i32]* @array_3, i32 0, i64 15), align 4
  store i32 15, i32* getelementptr inbounds ([16 x i32]* @array_4, i32 0, i64 15), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @print_arrays() #0 {
  %idx = alloca i32, align 4
  %bound = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 16, i32* %bound, align 4
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %idx, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %idx, align 4
  %4 = load i32* %bound, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %2
  %7 = load i32* %idx, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [16 x i32]* @array_1, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %10)
  %12 = load i32* %idx, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %idx, align 4
  br label %2

; <label>:14                                      ; preds = %2
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0))
  store i32 0, i32* %idx, align 4
  br label %16

; <label>:16                                      ; preds = %20, %14
  %17 = load i32* %idx, align 4
  %18 = load i32* %bound, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %28

; <label>:20                                      ; preds = %16
  %21 = load i32* %idx, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [16 x i32]* @array_2, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %24)
  %26 = load i32* %idx, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %idx, align 4
  br label %16

; <label>:28                                      ; preds = %16
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0))
  store i32 0, i32* %idx, align 4
  br label %30

; <label>:30                                      ; preds = %34, %28
  %31 = load i32* %idx, align 4
  %32 = load i32* %bound, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %42

; <label>:34                                      ; preds = %30
  %35 = load i32* %idx, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [16 x i32]* @array_3, i32 0, i64 %36
  %38 = load i32* %37, align 4
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %38)
  %40 = load i32* %idx, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %idx, align 4
  br label %30

; <label>:42                                      ; preds = %30
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0))
  store i32 0, i32* %idx, align 4
  br label %44

; <label>:44                                      ; preds = %48, %42
  %45 = load i32* %idx, align 4
  %46 = load i32* %bound, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %56

; <label>:48                                      ; preds = %44
  %49 = load i32* %idx, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [16 x i32]* @array_4, i32 0, i64 %50
  %52 = load i32* %51, align 4
  %53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %52)
  %54 = load i32* %idx, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %idx, align 4
  br label %44

; <label>:56                                      ; preds = %44
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %idx = alloca i32, align 4
  %bound = alloca i32, align 4
  %temp = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  store i32 16, i32* %bound, align 4
  call void @populate_arrays()
  call void @print_arrays()
  store i32 16, i32* %bound, align 4
  store i32 0, i32* %idx, align 4
  br label %2

; <label>:2                                       ; preds = %36, %18, %0
  %3 = load i32* %idx, align 4
  %4 = load i32* %bound, align 4
  %5 = sub nsw i32 %4, 1
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %39

; <label>:7                                       ; preds = %2
  %8 = load i32* %idx, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [16 x i32]* @array_1, i32 0, i64 %9
  %11 = load i32* %10, align 4
  %12 = load i32* %idx, align 4
  %13 = add nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [16 x i32]* @array_1, i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = icmp sgt i32 %11, %16
  br i1 %17, label %18, label %36

; <label>:18                                      ; preds = %7
  %19 = load i32* %idx, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [16 x i32]* @array_1, i32 0, i64 %20
  %22 = load i32* %21, align 4
  store i32 %22, i32* %temp, align 4
  %23 = load i32* %idx, align 4
  %24 = add nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [16 x i32]* @array_1, i32 0, i64 %25
  %27 = load i32* %26, align 4
  %28 = load i32* %idx, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [16 x i32]* @array_1, i32 0, i64 %29
  store i32 %27, i32* %30, align 4
  %31 = load i32* %temp, align 4
  %32 = load i32* %idx, align 4
  %33 = add nsw i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [16 x i32]* @array_1, i32 0, i64 %34
  store i32 %31, i32* %35, align 4
  store i32 0, i32* %idx, align 4
  br label %2

; <label>:36                                      ; preds = %7
  %37 = load i32* %idx, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %idx, align 4
  br label %2

; <label>:39                                      ; preds = %2
  store i32 0, i32* %idx, align 4
  br label %40

; <label>:40                                      ; preds = %74, %56, %39
  %41 = load i32* %idx, align 4
  %42 = load i32* %bound, align 4
  %43 = sub nsw i32 %42, 1
  %44 = icmp slt i32 %41, %43
  br i1 %44, label %45, label %77

; <label>:45                                      ; preds = %40
  %46 = load i32* %idx, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [16 x i32]* @array_2, i32 0, i64 %47
  %49 = load i32* %48, align 4
  %50 = load i32* %idx, align 4
  %51 = add nsw i32 %50, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [16 x i32]* @array_2, i32 0, i64 %52
  %54 = load i32* %53, align 4
  %55 = icmp sgt i32 %49, %54
  br i1 %55, label %56, label %74

; <label>:56                                      ; preds = %45
  %57 = load i32* %idx, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [16 x i32]* @array_2, i32 0, i64 %58
  %60 = load i32* %59, align 4
  store i32 %60, i32* %temp, align 4
  %61 = load i32* %idx, align 4
  %62 = add nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [16 x i32]* @array_2, i32 0, i64 %63
  %65 = load i32* %64, align 4
  %66 = load i32* %idx, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [16 x i32]* @array_2, i32 0, i64 %67
  store i32 %65, i32* %68, align 4
  %69 = load i32* %temp, align 4
  %70 = load i32* %idx, align 4
  %71 = add nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [16 x i32]* @array_2, i32 0, i64 %72
  store i32 %69, i32* %73, align 4
  store i32 0, i32* %idx, align 4
  br label %40

; <label>:74                                      ; preds = %45
  %75 = load i32* %idx, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %idx, align 4
  br label %40

; <label>:77                                      ; preds = %40
  store i32 0, i32* %idx, align 4
  br label %78

; <label>:78                                      ; preds = %112, %94, %77
  %79 = load i32* %idx, align 4
  %80 = load i32* %bound, align 4
  %81 = sub nsw i32 %80, 1
  %82 = icmp slt i32 %79, %81
  br i1 %82, label %83, label %115

; <label>:83                                      ; preds = %78
  %84 = load i32* %idx, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [16 x i32]* @array_3, i32 0, i64 %85
  %87 = load i32* %86, align 4
  %88 = load i32* %idx, align 4
  %89 = add nsw i32 %88, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [16 x i32]* @array_3, i32 0, i64 %90
  %92 = load i32* %91, align 4
  %93 = icmp sgt i32 %87, %92
  br i1 %93, label %94, label %112

; <label>:94                                      ; preds = %83
  %95 = load i32* %idx, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [16 x i32]* @array_1, i32 0, i64 %96
  %98 = load i32* %97, align 4
  store i32 %98, i32* %temp, align 4
  %99 = load i32* %idx, align 4
  %100 = add nsw i32 %99, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [16 x i32]* @array_3, i32 0, i64 %101
  %103 = load i32* %102, align 4
  %104 = load i32* %idx, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [16 x i32]* @array_3, i32 0, i64 %105
  store i32 %103, i32* %106, align 4
  %107 = load i32* %temp, align 4
  %108 = load i32* %idx, align 4
  %109 = add nsw i32 %108, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [16 x i32]* @array_3, i32 0, i64 %110
  store i32 %107, i32* %111, align 4
  store i32 0, i32* %idx, align 4
  br label %78

; <label>:112                                     ; preds = %83
  %113 = load i32* %idx, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %idx, align 4
  br label %78

; <label>:115                                     ; preds = %78
  store i32 0, i32* %idx, align 4
  br label %116

; <label>:116                                     ; preds = %150, %132, %115
  %117 = load i32* %idx, align 4
  %118 = load i32* %bound, align 4
  %119 = sub nsw i32 %118, 1
  %120 = icmp slt i32 %117, %119
  br i1 %120, label %121, label %153

; <label>:121                                     ; preds = %116
  %122 = load i32* %idx, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [16 x i32]* @array_4, i32 0, i64 %123
  %125 = load i32* %124, align 4
  %126 = load i32* %idx, align 4
  %127 = add nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [16 x i32]* @array_4, i32 0, i64 %128
  %130 = load i32* %129, align 4
  %131 = icmp sgt i32 %125, %130
  br i1 %131, label %132, label %150

; <label>:132                                     ; preds = %121
  %133 = load i32* %idx, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [16 x i32]* @array_4, i32 0, i64 %134
  %136 = load i32* %135, align 4
  store i32 %136, i32* %temp, align 4
  %137 = load i32* %idx, align 4
  %138 = add nsw i32 %137, 1
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [16 x i32]* @array_4, i32 0, i64 %139
  %141 = load i32* %140, align 4
  %142 = load i32* %idx, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [16 x i32]* @array_4, i32 0, i64 %143
  store i32 %141, i32* %144, align 4
  %145 = load i32* %temp, align 4
  %146 = load i32* %idx, align 4
  %147 = add nsw i32 %146, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [16 x i32]* @array_4, i32 0, i64 %148
  store i32 %145, i32* %149, align 4
  store i32 0, i32* %idx, align 4
  br label %116

; <label>:150                                     ; preds = %121
  %151 = load i32* %idx, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %idx, align 4
  br label %116

; <label>:153                                     ; preds = %116
  call void @print_arrays()
  %154 = load i32* %1
  ret i32 %154
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
