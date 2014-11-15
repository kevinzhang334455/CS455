; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"Give me a number (-1 to quit): \00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [39 x i8] c"I need a number that's either 0 or 1.\0A\00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"You gave me an even number of 0's.\0A\00", align 1
@.str4 = private unnamed_addr constant [36 x i8] c"You gave me an even number of 1's.\0A\00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"I therefore accept this input.\0A\00", align 1
@.str6 = private unnamed_addr constant [35 x i8] c"You gave me an odd number of 1's.\0A\00", align 1
@.str7 = private unnamed_addr constant [32 x i8] c"I therefore reject this input.\0A\00", align 1
@.str8 = private unnamed_addr constant [35 x i8] c"You gave me an odd number of 0's.\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @getnextdigit() #0 {
  %n = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  br label %1

; <label>:1                                       ; preds = %10, %0
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str, i32 0, i32 0))
  %3 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32* %n)
  %4 = load i32* %n, align 4
  %5 = icmp sle i32 -1, %4
  br i1 %5, label %6, label %._crit_edge

._crit_edge:                                      ; preds = %1
  br label %10

; <label>:6                                       ; preds = %1
  %7 = load i32* %n, align 4
  %8 = icmp sge i32 1, %7
  br i1 %8, label %9, label %._crit_edge1

._crit_edge1:                                     ; preds = %6
  br label %10

; <label>:9                                       ; preds = %6
  br label %12

; <label>:10                                      ; preds = %._crit_edge1, %._crit_edge
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0))
  br label %1

; <label>:12                                      ; preds = %9
  %13 = load i32* %n, align 4
  ret i32 %13
}

declare i32 @printf(i8*, ...) #1

declare i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @state_0() #0 {
  %a = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  %1 = call i32 @getnextdigit()
  store i32 %1, i32* %a, align 4
  %2 = load i32* %a, align 4
  %3 = icmp eq i32 -1, %2
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0))
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0))
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0))
  br label %16

; <label>:8                                       ; preds = %0
  %9 = load i32* %a, align 4
  %10 = icmp eq i32 0, %9
  br i1 %10, label %11, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %12

; <label>:11                                      ; preds = %8
  call void @state_2()
  br label %12

; <label>:12                                      ; preds = %._crit_edge, %11
  %13 = load i32* %a, align 4
  %14 = icmp eq i32 1, %13
  br i1 %14, label %15, label %._crit_edge1

._crit_edge1:                                     ; preds = %12
  br label %16

; <label>:15                                      ; preds = %12
  call void @state_1()
  br label %16

; <label>:16                                      ; preds = %._crit_edge1, %15, %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @state_2() #0 {
  %a = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  %1 = call i32 @getnextdigit()
  store i32 %1, i32* %a, align 4
  %2 = load i32* %a, align 4
  %3 = icmp eq i32 -1, %2
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str8, i32 0, i32 0))
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0))
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0))
  br label %16

; <label>:8                                       ; preds = %0
  %9 = load i32* %a, align 4
  %10 = icmp eq i32 0, %9
  br i1 %10, label %11, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %12

; <label>:11                                      ; preds = %8
  call void @state_0()
  br label %12

; <label>:12                                      ; preds = %._crit_edge, %11
  %13 = load i32* %a, align 4
  %14 = icmp eq i32 1, %13
  br i1 %14, label %15, label %._crit_edge1

._crit_edge1:                                     ; preds = %12
  br label %16

; <label>:15                                      ; preds = %12
  call void @state_3()
  br label %16

; <label>:16                                      ; preds = %._crit_edge1, %15, %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @state_1() #0 {
  %a = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  %1 = call i32 @getnextdigit()
  store i32 %1, i32* %a, align 4
  %2 = load i32* %a, align 4
  %3 = icmp eq i32 -1, %2
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0))
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str6, i32 0, i32 0))
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0))
  br label %16

; <label>:8                                       ; preds = %0
  %9 = load i32* %a, align 4
  %10 = icmp eq i32 0, %9
  br i1 %10, label %11, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %12

; <label>:11                                      ; preds = %8
  call void @state_3()
  br label %12

; <label>:12                                      ; preds = %._crit_edge, %11
  %13 = load i32* %a, align 4
  %14 = icmp eq i32 1, %13
  br i1 %14, label %15, label %._crit_edge1

._crit_edge1:                                     ; preds = %12
  br label %16

; <label>:15                                      ; preds = %12
  call void @state_0()
  br label %16

; <label>:16                                      ; preds = %._crit_edge1, %15, %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @state_3() #0 {
  %a = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  %1 = call i32 @getnextdigit()
  store i32 %1, i32* %a, align 4
  %2 = load i32* %a, align 4
  %3 = icmp eq i32 -1, %2
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str8, i32 0, i32 0))
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str6, i32 0, i32 0))
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0))
  br label %16

; <label>:8                                       ; preds = %0
  %9 = load i32* %a, align 4
  %10 = icmp eq i32 0, %9
  br i1 %10, label %11, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %12

; <label>:11                                      ; preds = %8
  call void @state_1()
  br label %12

; <label>:12                                      ; preds = %._crit_edge, %11
  %13 = load i32* %a, align 4
  %14 = icmp eq i32 1, %13
  br i1 %14, label %15, label %._crit_edge1

._crit_edge1:                                     ; preds = %12
  br label %16

; <label>:15                                      ; preds = %12
  call void @state_2()
  br label %16

; <label>:16                                      ; preds = %._crit_edge1, %15, %4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %"reg2mem alloca point" = bitcast i32 0 to i32
  call void @state_0()
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
