; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"I need a non-negative number: \00", align 1
@.str2 = private unnamed_addr constant [63 x i8] c"Welcome to the United States 1040 federal income tax program.\0A\00", align 1
@.str3 = private unnamed_addr constant [65 x i8] c"(Note: this isn't the real 1040 form. If you try to submit your\0A\00", align 1
@.str4 = private unnamed_addr constant [47 x i8] c"taxes this way, you'll get what you deserve!\0A\0A\00", align 1
@.str5 = private unnamed_addr constant [60 x i8] c"Answer the following questions to determine what you owe.\0A\0A\00", align 1
@.str6 = private unnamed_addr constant [32 x i8] c"Total wages, salary, and tips? \00", align 1
@.str7 = private unnamed_addr constant [48 x i8] c"Taxable interest (such as from bank accounts)? \00", align 1
@.str8 = private unnamed_addr constant [64 x i8] c"Unemployment compensation, qualified state tuition, and Alaska\0A\00", align 1
@.str9 = private unnamed_addr constant [27 x i8] c"Permanent Fund dividends? \00", align 1
@.str10 = private unnamed_addr constant [32 x i8] c"Your adjusted gross income is: \00", align 1
@.str11 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str12 = private unnamed_addr constant [65 x i8] c"Enter <1> if your parents or someone else can claim you on their\00", align 1
@.str13 = private unnamed_addr constant [32 x i8] c" return. \0AEnter <0> otherwise: \00", align 1
@.str14 = private unnamed_addr constant [54 x i8] c"Enter <1> if you are single, <0> if you are married: \00", align 1
@.str15 = private unnamed_addr constant [57 x i8] c"Enter <1> if your spouse can be claimed as a dependant, \00", align 1
@.str16 = private unnamed_addr constant [19 x i8] c"enter <0> if not: \00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"Your taxable income is: \00", align 1
@.str18 = private unnamed_addr constant [50 x i8] c"Enter the amount of Federal income tax withheld: \00", align 1
@.str19 = private unnamed_addr constant [53 x i8] c"Enter <1> if you get an earned income credit (EIC); \00", align 1
@.str20 = private unnamed_addr constant [20 x i8] c"enter 0 otherwise: \00", align 1
@.str21 = private unnamed_addr constant [55 x i8] c"OK, I'll give you a thousand dollars for your credit.\0A\00", align 1
@.str22 = private unnamed_addr constant [36 x i8] c"Your total tax payments amount to: \00", align 1
@.str23 = private unnamed_addr constant [30 x i8] c"Your total tax liability is: \00", align 1
@.str24 = private unnamed_addr constant [43 x i8] c"Congratulations, you get a tax refund of $\00", align 1
@.str25 = private unnamed_addr constant [38 x i8] c"Bummer. You owe the IRS a check for $\00", align 1
@.str26 = private unnamed_addr constant [29 x i8] c"Thank you for using ez-tax.\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @getinput() #0 {
  %inp = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 -1, i32* %inp, align 4
  br label %1

; <label>:1                                       ; preds = %10, %0
  %2 = load i32* %inp, align 4
  %3 = icmp sgt i32 0, %2
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32* %inp)
  %6 = load i32* %inp, align 4
  %7 = icmp sgt i32 0, %6
  br i1 %7, label %8, label %._crit_edge

._crit_edge:                                      ; preds = %4
  br label %10

; <label>:8                                       ; preds = %4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0))
  br label %10

; <label>:10                                      ; preds = %._crit_edge, %8
  br label %1

; <label>:11                                      ; preds = %1
  %12 = load i32* %inp, align 4
  ret i32 %12
}

declare i32 @__isoc99_scanf(i8*, ...) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %line1 = alloca i32, align 4
  %line2 = alloca i32, align 4
  %line3 = alloca i32, align 4
  %line4 = alloca i32, align 4
  %line5 = alloca i32, align 4
  %line6 = alloca i32, align 4
  %line7 = alloca i32, align 4
  %line8 = alloca i32, align 4
  %deadline11 = alloca i32, align 4
  %deadline12 = alloca i32, align 4
  %line10 = alloca i32, align 4
  %dependant = alloca i32, align 4
  %single = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %eic = alloca i32, align 4
  %spousedependant = alloca i32, align 4
  %"reg2mem alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %1
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([63 x i8]* @.str2, i32 0, i32 0))
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([65 x i8]* @.str3, i32 0, i32 0))
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str4, i32 0, i32 0))
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str5, i32 0, i32 0))
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str6, i32 0, i32 0))
  %7 = call i32 @getinput()
  store i32 %7, i32* %line1, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str7, i32 0, i32 0))
  %9 = call i32 @getinput()
  store i32 %9, i32* %line2, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([64 x i8]* @.str8, i32 0, i32 0))
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str9, i32 0, i32 0))
  %12 = call i32 @getinput()
  store i32 %12, i32* %line3, align 4
  %13 = load i32* %line1, align 4
  %14 = load i32* %line2, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32* %line3, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, i32* %line4, align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str10, i32 0, i32 0))
  %19 = load i32* %line4, align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %19)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([65 x i8]* @.str12, i32 0, i32 0))
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str13, i32 0, i32 0))
  %23 = call i32 @getinput()
  store i32 %23, i32* %dependant, align 4
  %24 = load i32* %dependant, align 4
  %25 = icmp ne i32 0, %24
  br i1 %25, label %26, label %._crit_edge

._crit_edge:                                      ; preds = %0
  br label %65

; <label>:26                                      ; preds = %0
  store i32 700, i32* %b, align 4
  %27 = load i32* %b, align 4
  store i32 %27, i32* %c, align 4
  %28 = load i32* %c, align 4
  %29 = load i32* %line1, align 4
  %30 = add nsw i32 %29, 250
  %31 = icmp slt i32 %28, %30
  br i1 %31, label %32, label %._crit_edge1

._crit_edge1:                                     ; preds = %26
  br label %35

; <label>:32                                      ; preds = %26
  %33 = load i32* %line1, align 4
  %34 = add nsw i32 %33, 250
  store i32 %34, i32* %c, align 4
  br label %35

; <label>:35                                      ; preds = %._crit_edge1, %32
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str14, i32 0, i32 0))
  %37 = call i32 @getinput()
  store i32 %37, i32* %single, align 4
  %38 = load i32* %single, align 4
  %39 = icmp ne i32 0, %38
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %35
  store i32 7350, i32* %d, align 4
  br label %42

; <label>:41                                      ; preds = %35
  store i32 7350, i32* %d, align 4
  br label %42

; <label>:42                                      ; preds = %41, %40
  %43 = load i32* %c, align 4
  store i32 %43, i32* %e, align 4
  %44 = load i32* %e, align 4
  %45 = load i32* %d, align 4
  %46 = icmp sgt i32 %44, %45
  br i1 %46, label %47, label %._crit_edge2

._crit_edge2:                                     ; preds = %42
  br label %49

; <label>:47                                      ; preds = %42
  %48 = load i32* %d, align 4
  store i32 %48, i32* %e, align 4
  br label %49

; <label>:49                                      ; preds = %._crit_edge2, %47
  store i32 0, i32* %f, align 4
  %50 = load i32* %single, align 4
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %._crit_edge3

._crit_edge3:                                     ; preds = %49
  br label %60

; <label>:52                                      ; preds = %49
  %53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([57 x i8]* @.str15, i32 0, i32 0))
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str16, i32 0, i32 0))
  %55 = call i32 @getinput()
  store i32 %55, i32* %spousedependant, align 4
  %56 = load i32* %spousedependant, align 4
  %57 = icmp eq i32 0, %56
  br i1 %57, label %58, label %._crit_edge4

._crit_edge4:                                     ; preds = %52
  br label %59

; <label>:58                                      ; preds = %52
  store i32 2800, i32* %f, align 4
  br label %59

; <label>:59                                      ; preds = %._crit_edge4, %58
  br label %60

; <label>:60                                      ; preds = %._crit_edge3, %59
  %61 = load i32* %e, align 4
  %62 = load i32* %f, align 4
  %63 = add nsw i32 %61, %62
  store i32 %63, i32* %g, align 4
  %64 = load i32* %g, align 4
  store i32 %64, i32* %line5, align 4
  br label %65

; <label>:65                                      ; preds = %._crit_edge, %60
  %66 = load i32* %dependant, align 4
  %67 = icmp eq i32 0, %66
  br i1 %67, label %68, label %._crit_edge5

._crit_edge5:                                     ; preds = %65
  br label %79

; <label>:68                                      ; preds = %65
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str14, i32 0, i32 0))
  %70 = call i32 @getinput()
  store i32 %70, i32* %single, align 4
  %71 = load i32* %single, align 4
  %72 = icmp ne i32 0, %71
  br i1 %72, label %73, label %._crit_edge6

._crit_edge6:                                     ; preds = %68
  br label %74

; <label>:73                                      ; preds = %68
  store i32 12950, i32* %line5, align 4
  br label %74

; <label>:74                                      ; preds = %._crit_edge6, %73
  %75 = load i32* %single, align 4
  %76 = icmp eq i32 0, %75
  br i1 %76, label %77, label %._crit_edge7

._crit_edge7:                                     ; preds = %74
  br label %78

; <label>:77                                      ; preds = %74
  store i32 7200, i32* %line5, align 4
  br label %78

; <label>:78                                      ; preds = %._crit_edge7, %77
  br label %79

; <label>:79                                      ; preds = %._crit_edge5, %78
  %80 = load i32* %line4, align 4
  %81 = load i32* %line5, align 4
  %82 = sub nsw i32 %80, %81
  store i32 %82, i32* %line6, align 4
  %83 = load i32* %line6, align 4
  %84 = icmp slt i32 %83, 0
  br i1 %84, label %85, label %._crit_edge8

._crit_edge8:                                     ; preds = %79
  br label %86

; <label>:85                                      ; preds = %79
  store i32 0, i32* %line6, align 4
  br label %86

; <label>:86                                      ; preds = %._crit_edge8, %85
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i32 0, i32 0))
  %88 = load i32* %line6, align 4
  %89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %88)
  %90 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str18, i32 0, i32 0))
  %91 = call i32 @getinput()
  store i32 %91, i32* %line7, align 4
  %92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str19, i32 0, i32 0))
  %93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0))
  %94 = call i32 @getinput()
  store i32 %94, i32* %eic, align 4
  store i32 0, i32* %line8, align 4
  %95 = load i32* %eic, align 4
  %96 = icmp ne i32 0, %95
  br i1 %96, label %97, label %._crit_edge9

._crit_edge9:                                     ; preds = %86
  br label %99

; <label>:97                                      ; preds = %86
  %98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str21, i32 0, i32 0))
  store i32 1000, i32* %line8, align 4
  br label %99

; <label>:99                                      ; preds = %._crit_edge9, %97
  %100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str22, i32 0, i32 0))
  %101 = load i32* %line8, align 4
  %102 = load i32* %line7, align 4
  %103 = add nsw i32 %101, %102
  %104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %103)
  %105 = load i32* %line6, align 4
  %106 = mul nsw i32 %105, 28
  %107 = add nsw i32 %106, 50
  %108 = sdiv i32 %107, 100
  store i32 %108, i32* %line10, align 4
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str23, i32 0, i32 0))
  %110 = load i32* %line10, align 4
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %110)
  %112 = load i32* %line8, align 4
  %113 = load i32* %line7, align 4
  %114 = add nsw i32 %112, %113
  %115 = load i32* %line10, align 4
  %116 = sub nsw i32 %114, %115
  %117 = icmp slt i32 %116, 0
  br i1 %117, label %118, label %119

; <label>:118                                     ; preds = %99
  store i32 0, i32* %deadline11, align 4
  br label %120

; <label>:119                                     ; preds = %99
  store i32 0, i32* %deadline11, align 4
  br label %120

; <label>:120                                     ; preds = %119, %118
  %121 = load i32* %line8, align 4
  %122 = load i32* %line7, align 4
  %123 = add nsw i32 %121, %122
  %124 = load i32* %line10, align 4
  %125 = sub nsw i32 %123, %124
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %127, label %._crit_edge10

._crit_edge10:                                    ; preds = %120
  br label %135

; <label>:127                                     ; preds = %120
  %128 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str24, i32 0, i32 0))
  %129 = load i32* %line8, align 4
  %130 = load i32* %line7, align 4
  %131 = add nsw i32 %129, %130
  %132 = load i32* %line10, align 4
  %133 = sub nsw i32 %131, %132
  %134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %133)
  br label %135

; <label>:135                                     ; preds = %._crit_edge10, %127
  %136 = load i32* %line10, align 4
  %137 = load i32* %line8, align 4
  %138 = load i32* %line7, align 4
  %139 = add nsw i32 %137, %138
  %140 = sub nsw i32 %136, %139
  %141 = icmp sge i32 %140, 0
  br i1 %141, label %142, label %._crit_edge11

._crit_edge11:                                    ; preds = %135
  br label %150

; <label>:142                                     ; preds = %135
  %143 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str25, i32 0, i32 0))
  %144 = load i32* %line10, align 4
  %145 = load i32* %line8, align 4
  %146 = load i32* %line7, align 4
  %147 = add nsw i32 %145, %146
  %148 = sub nsw i32 %144, %147
  %149 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %148)
  br label %150

; <label>:150                                     ; preds = %._crit_edge11, %142
  %151 = load i32* %line10, align 4
  %152 = load i32* %line8, align 4
  %153 = load i32* %line7, align 4
  %154 = add nsw i32 %152, %153
  %155 = sub nsw i32 %151, %154
  %156 = icmp slt i32 %155, 0
  br i1 %156, label %157, label %158

; <label>:157                                     ; preds = %150
  store i32 0, i32* %deadline12, align 4
  br label %159

; <label>:158                                     ; preds = %150
  store i32 0, i32* %deadline12, align 4
  br label %159

; <label>:159                                     ; preds = %158, %157
  %160 = load i32* %line6, align 4
  %161 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %160)
  %162 = load i32* %line8, align 4
  %163 = load i32* %line7, align 4
  %164 = add nsw i32 %162, %163
  %165 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %164)
  %166 = load i32* %line10, align 4
  %167 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %166)
  %168 = load i32* %b, align 4
  %169 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %168)
  %170 = load i32* %e, align 4
  %171 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %170)
  %172 = load i32* %d, align 4
  %173 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %172)
  %174 = load i32* %deadline11, align 4
  %175 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %174)
  %176 = load i32* %deadline12, align 4
  %177 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i32 %176)
  %178 = load i32* %line10, align 4
  store i32 %178, i32* %line6, align 4
  store i32 0, i32* %line8, align 4
  store i32 0, i32* %line10, align 4
  %179 = load i32* %b, align 4
  %180 = load i32* %deadline12, align 4
  %181 = add nsw i32 %179, %180
  store i32 %181, i32* %deadline11, align 4
  %182 = load i32* %e, align 4
  %183 = load i32* %d, align 4
  %184 = add nsw i32 %182, %183
  store i32 %184, i32* %deadline12, align 4
  %185 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i32 0, i32 0))
  %186 = load i32* %1
  ret i32 %186
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
