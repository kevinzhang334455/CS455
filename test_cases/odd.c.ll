; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"input a number, e.g. 255\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"odd\00", align 1
@.str3 = private unnamed_addr constant [5 x i8] c"even\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"%d is %s\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %parity = alloca i32, align 4
  %answer = alloca i8*, align 8
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0))
  %5 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32* %i)
  %6 = load i32* %i, align 4
  %7 = srem i32 %6, 2
  store i32 %7, i32* %parity, align 4
  %8 = load i32* %parity, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  br label %12

; <label>:11                                      ; preds = %0
  store i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i8** %answer, align 8
  br label %13

; <label>:12                                      ; preds = %10
  store i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i8** %answer, align 8
  br label %13

; <label>:13                                      ; preds = %12, %11
  %14 = load i32* %i, align 4
  %15 = load i8** %answer, align 8
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0), i32 %14, i8* %15)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i32 @__isoc99_scanf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
