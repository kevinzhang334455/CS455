#include "cs255lib.h"
#include <stdio.h>
#include <stdlib.h>

/* func decls begin */
/* func decls end */

  /* Ast::Scope prog: 1 symbols, 1 children */
  char str[10] = "19 s=%2d\n";

int main (){
    /* Ast::Block main body: 9 symbols, 18 children */
    int var_x;
    int var_y;
    int var_z;
    int var_reg2mem_alloca_point;
    int var_1;
    int var_2;
    int var_3;
    int var_4;
    int var_5;

    cs255_inc();
    cs255_init();
    var_y = 0;
    cs255_inc();
    var_x = 1;
    cs255_inc();
    var_1 = var_x;
    cs255_inc();
    var_2 = var_y;
    cs255_inc();
    var_3 = (var_1 + var_2);
    cs255_inc();
    var_z = var_3;
    cs255_inc();
    var_4 = var_z;
    cs255_inc();
    var_5 = printf((& str[0]), var_4);
    return 0;
}
