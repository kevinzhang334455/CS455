#include <stdio.h>
#include "cs255-lib.h"

void init() {
  counter = 0;
}

void inc() {
  counter++;
}

void output() {
  printf("counter: %d\n", counter);
}
