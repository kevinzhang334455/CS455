#include <stdio.h>
#include "cs255-lib.h"

int counter=-1;

void init()
{
	counter=0;
}

void increase()
{
	counter++;
}

void output()
{
	printf("counter=%d\n", counter);
}
