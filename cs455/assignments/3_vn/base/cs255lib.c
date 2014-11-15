#include <stdio.h>
#include <stdlib.h>
#include "cs255lib.h"

static int counter=-1;

static void output()
{
    printf("counter=%d\n", counter);
}

void cs255_init()
{
    counter=0;
    atexit(output);
}

void cs255_inc()
{
    counter++;
}


