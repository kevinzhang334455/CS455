; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [33 x i8] c"Please input an integer number: \00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"Final Result: s = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %s = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0))
  %4 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32* %a)
  store i32 50, i32* %b, align 4
  store i32 500, i32* %c, align 4
  store i32 0, i32* %s, align 4
  %5 = load i32* %c, align 4
  %6 = load i32* %c, align 4
  %7 = sdiv i32 %5, %6
  %8 = load i32* %s, align 4
  %9 = sdiv i32 %8, %7
  store i32 %9, i32* %s, align 4
  %10 = load i32* %c, align 4
  %11 = load i32* %c, align 4
  %12 = add nsw i32 %10, %11
  %13 = load i32* %s, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, i32* %s, align 4
  %15 = load i32* %c, align 4
  %16 = load i32* %a, align 4
  %17 = sdiv i32 %15, %16
  %18 = load i32* %s, align 4
  %19 = sdiv i32 %18, %17
  store i32 %19, i32* %s, align 4
  %20 = load i32* %b, align 4
  %21 = load i32* %c, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, i32* %c, align 4
  %23 = load i32* %b, align 4
  %24 = load i32* %a, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32* %s, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, i32* %s, align 4
  %28 = load i32* %b, align 4
  %29 = load i32* %a, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32* %s, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, i32* %s, align 4
  %33 = load i32* %b, align 4
  %34 = load i32* %c, align 4
  %35 = add nsw i32 %33, %34
  %36 = load i32* %s, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, i32* %s, align 4
  %38 = load i32* %a, align 4
  %39 = load i32* %b, align 4
  %40 = add nsw i32 %38, %39
  %41 = load i32* %s, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, i32* %s, align 4
  %43 = load i32* %a, align 4
  %44 = load i32* %a, align 4
  %45 = sdiv i32 %43, %44
  %46 = load i32* %s, align 4
  %47 = sdiv i32 %46, %45
  store i32 %47, i32* %s, align 4
  %48 = load i32* %b, align 4
  %49 = load i32* %a, align 4
  %50 = sdiv i32 %48, %49
  store i32 %50, i32* %c, align 4
  %51 = load i32* %b, align 4
  %52 = load i32* %a, align 4
  %53 = sdiv i32 %51, %52
  %54 = load i32* %s, align 4
  %55 = sdiv i32 %54, %53
  store i32 %55, i32* %s, align 4
  %56 = load i32* %c, align 4
  %57 = load i32* %b, align 4
  %58 = add nsw i32 %56, %57
  %59 = load i32* %s, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, i32* %s, align 4
  %61 = load i32* %a, align 4
  %62 = load i32* %b, align 4
  %63 = add nsw i32 %61, %62
  %64 = load i32* %s, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, i32* %s, align 4
  %66 = load i32* %c, align 4
  %67 = load i32* %a, align 4
  %68 = add nsw i32 %66, %67
  %69 = load i32* %s, align 4
  %70 = add nsw i32 %69, %68
  store i32 %70, i32* %s, align 4
  %71 = load i32* %c, align 4
  %72 = load i32* %c, align 4
  %73 = add nsw i32 %71, %72
  %74 = load i32* %s, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, i32* %s, align 4
  %76 = load i32* %c, align 4
  %77 = load i32* %b, align 4
  %78 = add nsw i32 %76, %77
  %79 = load i32* %s, align 4
  %80 = add nsw i32 %79, %78
  store i32 %80, i32* %s, align 4
  %81 = load i32* %b, align 4
  %82 = load i32* %a, align 4
  %83 = add nsw i32 %81, %82
  store i32 %83, i32* %c, align 4
  %84 = load i32* %c, align 4
  %85 = load i32* %b, align 4
  %86 = sdiv i32 %84, %85
  %87 = load i32* %s, align 4
  %88 = sdiv i32 %87, %86
  store i32 %88, i32* %s, align 4
  %89 = load i32* %c, align 4
  %90 = load i32* %a, align 4
  %91 = add nsw i32 %89, %90
  store i32 %91, i32* %b, align 4
  %92 = load i32* %b, align 4
  %93 = load i32* %a, align 4
  %94 = sdiv i32 %92, %93
  %95 = load i32* %s, align 4
  %96 = sdiv i32 %95, %94
  store i32 %96, i32* %s, align 4
  %97 = load i32* %a, align 4
  %98 = load i32* %b, align 4
  %99 = add nsw i32 %97, %98
  %100 = load i32* %s, align 4
  %101 = add nsw i32 %100, %99
  store i32 %101, i32* %s, align 4
  %102 = load i32* %c, align 4
  %103 = load i32* %b, align 4
  %104 = add nsw i32 %102, %103
  %105 = load i32* %s, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, i32* %s, align 4
  %107 = load i32* %c, align 4
  %108 = load i32* %a, align 4
  %109 = add nsw i32 %107, %108
  %110 = load i32* %s, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, i32* %s, align 4
  %112 = load i32* %a, align 4
  %113 = load i32* %a, align 4
  %114 = add nsw i32 %112, %113
  store i32 %114, i32* %c, align 4
  %115 = load i32* %a, align 4
  %116 = load i32* %c, align 4
  %117 = add nsw i32 %115, %116
  %118 = load i32* %s, align 4
  %119 = add nsw i32 %118, %117
  store i32 %119, i32* %s, align 4
  %120 = load i32* %b, align 4
  %121 = load i32* %a, align 4
  %122 = add nsw i32 %120, %121
  store i32 %122, i32* %c, align 4
  %123 = load i32* %a, align 4
  %124 = load i32* %a, align 4
  %125 = add nsw i32 %123, %124
  %126 = load i32* %s, align 4
  %127 = add nsw i32 %126, %125
  store i32 %127, i32* %s, align 4
  %128 = load i32* %b, align 4
  %129 = load i32* %a, align 4
  %130 = sdiv i32 %128, %129
  store i32 %130, i32* %c, align 4
  %131 = load i32* %b, align 4
  %132 = load i32* %c, align 4
  %133 = sdiv i32 %131, %132
  store i32 %133, i32* %c, align 4
  %134 = load i32* %a, align 4
  %135 = load i32* %c, align 4
  %136 = sdiv i32 %134, %135
  store i32 %136, i32* %a, align 4
  %137 = load i32* %b, align 4
  %138 = load i32* %a, align 4
  %139 = add nsw i32 %137, %138
  %140 = load i32* %s, align 4
  %141 = add nsw i32 %140, %139
  store i32 %141, i32* %s, align 4
  %142 = load i32* %s, align 4
  %143 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %142)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i32 @__isoc99_scanf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
