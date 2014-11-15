; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [144 x i32] zeroinitializer, align 16
@b = common global [144 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"The sampled element is %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %40, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 12
  br i1 %4, label %5, label %43

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %36, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 12
  br i1 %8, label %9, label %39

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4
  %11 = sitofp i32 %10 to double
  %12 = fadd double 1.200000e+01, %11
  %13 = load i32* %j, align 4
  %14 = sitofp i32 %13 to double
  %15 = fadd double %12, %14
  %16 = fptosi double %15 to i32
  %17 = load i32* %j, align 4
  %18 = load i32* %i, align 4
  %19 = mul nsw i32 %18, 12
  %20 = add nsw i32 %17, %19
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [144 x i32]* @a, i32 0, i64 %21
  store i32 %16, i32* %22, align 4
  %23 = load i32* %i, align 4
  %24 = sitofp i32 %23 to double
  %25 = fadd double 1.200000e+01, %24
  %26 = load i32* %j, align 4
  %27 = sitofp i32 %26 to double
  %28 = fadd double %25, %27
  %29 = fptosi double %28 to i32
  %30 = load i32* %j, align 4
  %31 = load i32* %i, align 4
  %32 = mul nsw i32 %31, 12
  %33 = add nsw i32 %30, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [144 x i32]* @b, i32 0, i64 %34
  store i32 %29, i32* %35, align 4
  br label %36

; <label>:36                                      ; preds = %9
  %37 = load i32* %j, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %j, align 4
  br label %6

; <label>:39                                      ; preds = %6
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32* %i, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %i, align 4
  br label %2

; <label>:43                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %44

; <label>:44                                      ; preds = %98, %43
  %45 = load i32* %i, align 4
  %46 = icmp slt i32 %45, 11
  br i1 %46, label %47, label %101

; <label>:47                                      ; preds = %44
  store i32 0, i32* %j, align 4
  br label %48

; <label>:48                                      ; preds = %94, %47
  %49 = load i32* %j, align 4
  %50 = icmp slt i32 %49, 11
  br i1 %50, label %51, label %97

; <label>:51                                      ; preds = %48
  %52 = load i32* %i, align 4
  %53 = sub nsw i32 %52, 1
  %54 = load i32* %j, align 4
  %55 = mul nsw i32 %54, 12
  %56 = add nsw i32 %53, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [144 x i32]* @b, i32 0, i64 %57
  %59 = load i32* %58, align 4
  %60 = load i32* %i, align 4
  %61 = add nsw i32 %60, 1
  %62 = load i32* %j, align 4
  %63 = mul nsw i32 %62, 12
  %64 = add nsw i32 %61, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [144 x i32]* @b, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = add nsw i32 %59, %67
  %69 = load i32* %i, align 4
  %70 = load i32* %j, align 4
  %71 = add nsw i32 %69, %70
  %72 = sub nsw i32 %71, 12
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [144 x i32]* @b, i32 0, i64 %73
  %75 = load i32* %74, align 4
  %76 = add nsw i32 %68, %75
  %77 = load i32* %i, align 4
  %78 = load i32* %j, align 4
  %79 = add nsw i32 %77, %78
  %80 = add nsw i32 %79, 12
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [144 x i32]* @b, i32 0, i64 %81
  %83 = load i32* %82, align 4
  %84 = add nsw i32 %76, %83
  %85 = sitofp i32 %84 to double
  %86 = fmul double 2.500000e-01, %85
  %87 = fptosi double %86 to i32
  %88 = load i32* %i, align 4
  %89 = load i32* %j, align 4
  %90 = mul nsw i32 %89, 12
  %91 = add nsw i32 %88, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [144 x i32]* @a, i32 0, i64 %92
  store i32 %87, i32* %93, align 4
  br label %94

; <label>:94                                      ; preds = %51
  %95 = load i32* %j, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %j, align 4
  br label %48

; <label>:97                                      ; preds = %48
  br label %98

; <label>:98                                      ; preds = %97
  %99 = load i32* %i, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %i, align 4
  br label %44

; <label>:101                                     ; preds = %44
  store i32 0, i32* %i, align 4
  br label %102

; <label>:102                                     ; preds = %127, %101
  %103 = load i32* %i, align 4
  %104 = icmp slt i32 %103, 11
  br i1 %104, label %105, label %130

; <label>:105                                     ; preds = %102
  store i32 0, i32* %j, align 4
  br label %106

; <label>:106                                     ; preds = %123, %105
  %107 = load i32* %j, align 4
  %108 = icmp slt i32 %107, 11
  br i1 %108, label %109, label %126

; <label>:109                                     ; preds = %106
  %110 = load i32* %i, align 4
  %111 = load i32* %j, align 4
  %112 = mul nsw i32 %111, 12
  %113 = add nsw i32 %110, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [144 x i32]* @a, i32 0, i64 %114
  %116 = load i32* %115, align 4
  %117 = load i32* %i, align 4
  %118 = load i32* %j, align 4
  %119 = mul nsw i32 %118, 12
  %120 = add nsw i32 %117, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [144 x i32]* @b, i32 0, i64 %121
  store i32 %116, i32* %122, align 4
  br label %123

; <label>:123                                     ; preds = %109
  %124 = load i32* %j, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %j, align 4
  br label %106

; <label>:126                                     ; preds = %106
  br label %127

; <label>:127                                     ; preds = %126
  %128 = load i32* %i, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %i, align 4
  br label %102

; <label>:130                                     ; preds = %102
  %131 = load i32* getelementptr inbounds ([144 x i32]* @b, i32 0, i64 78), align 4
  %132 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str, i32 0, i32 0), i32 %131)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
