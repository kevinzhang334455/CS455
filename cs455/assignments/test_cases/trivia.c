#include <stdio.h>

int main(int argc, char **argv){
  int a, b, c, s;
  printf("Please input an integer number: ");
  scanf("%d",&a);
  b = 50;
  c = 500;
  s = 0;
  s /= c / c;   //printf("08 s=%d\n", s);
  s += c + c;   //printf("09 s=%d\n", s);
  s /= c / a;   //printf("10 s=%d\n", s);
  c = b + c;    //printf("11 c=%d\n", c);
  s += b + a;   //printf("12 s=%d\n", s);
  s += b + a;   //printf("13 s=%d\n", s);
  s += b + c;   //printf("14 s=%d\n", s);
  s += a + b;   //printf("15 s=%d\n", s);
  s /= a / a;   //printf("16 s=%d\n", s);
  c = b / a;    //printf("17 c=%d\n", c);
  s /= b / a;   //printf("18 s=%d\n", s);
  s += c + b;   //printf("19 s=%d\n", s);
  s += a + b;   //printf("20 s=%d\n", s);
  s += c + a;   //printf("21 s=%d\n", s);
  s += c + c;   //printf("22 s=%d\n", s);
  s += c + b;   //printf("23 s=%d\n", s);
  c = b + a;    //printf("24 c=%d\n", c);
  s /= c / b;   //printf("25 s=%d\n", s);
  b = c + a;    //printf("26 b=%d\n", b);
  s /= b / a;   //printf("27 s=%d\n", s);
  s += a + b;   //printf("28 s=%d\n", s);
  s += c + b;   //printf("29 s=%d\n", s);
  s += c + a;   //printf("30 s=%d\n", s);
  c = a + a;    //printf("31 c=%d\n", c);
  s += a + c;   //printf("32 s=%d\n", s);
  c = b + a;    //printf("33 c=%d\n", c);
  s += a + a;   //printf("34 s=%d\n", s);
  c = b / a;    //printf("35 c=%d\n", c);
  c = b / c;    //printf("36 c=%d\n", c);
  a = a / c;    //printf("37 a=%d\n", a);
  s += b + a;   //printf("38 s=%d\n", s);
  printf("Final Result: s = %d\n", s); 
}
