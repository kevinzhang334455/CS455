#include <stdio.h>
#include <stdlib.h>

/* func decls begin */
/* func decls end */

  /* Ast::Scope prog: 1 symbols, 1 children */
  char str[10] = "19 s=%2d\n";

int main (){
    /* Ast::Block main body: 9 symbols, 10 children */
    int var_x;
    int var_y;
    int var_z;
    int var_reg2mem_alloca_point;
    int var_1;
    int var_2;
    int var_3;
    int var_4;
    int var_5;

    var_reg2mem_alloca_point = 0;
    var_y = 0;
    var_x = 1;
    var_1 = var_x;
    var_2 = var_y;
    var_3 = (var_1 + var_2);
    var_z = var_3;
    var_4 = var_z;
    var_5 = printf((& str[0]), var_4);
    return 0;
}
