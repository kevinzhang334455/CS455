/*
 * The file for the project of csc255/455.
 * Count the number of statements at gimple level.
 * Create Jan. 21, 2008 by Xiaoming Gu at URCS.
 */

#include "cs255-lib.h"
#include "config.h"
#include "system.h"
#include "coretypes.h"
#include "tm.h"
#include "tree.h"
#include "tree-inline.h"
#include "c-tree.h"
#include "flags.h"
#include "rtl.h"
#include "tm_p.h"
#include "ggc.h"
#include "basic-block.h"
#include "output.h"
#include "errors.h"
#include "expr.h"
#include "function.h"
#include "diagnostic.h"
#include "tree-flow.h"
#include "tree-dump.h"
#include "tree-pass.h"
#include "treelang/treelang.h"
#include <time.h>

/* Forward declaration */
static void insert_init_and_report_calls(void);
static void count_static_bb_and_stmt(void);

/* Names of the calls to be inserted for statement/basic block counting*/
static const char *f_init = "init";
static const char *f_inc = "increase";
static const char *f_out = "output";


/*  Dump how many basic blocks are 
 *  executed in a run.
 */
static void count_dynamic_bb (void)
{
  /* The following code transforms the program to count
     the number of dynamic basic block executions.  
     For Part I, you need to transform the program to
     count the number of dynamic statement executions.
     You can based you work on the following code. */
  basic_block bb;
  FOR_EACH_BB (bb)
  {
    tree instm, r_inc_decl, fname, ftype;    
    const char *funcname = get_name (current_function_decl);
    fname = get_identifier (f_inc);
    ftype = build_function_type (void_type_node, NULL);
    r_inc_decl = build_decl (FUNCTION_DECL, fname, ftype);
    instm = build_function_call_expr (r_inc_decl, NULL);  
    block_stmt_iterator bsi;
    bsi = bsi_start (bb);
    if (strcmp (funcname,"increase"))
    {
    bsi_insert_before (&bsi, instm, TSI_SAME_STMT);
    increase();
    }
  }

  /* Initialize counters and report results */
  /* Inserting at the end so the calls will not be counted */
  insert_init_and_report_calls();
}

/*  This is the main function of the cs255 pass.
 */
static unsigned int rest_of_handle_cs255(void)
{
  printf ("Pass cs255 execution.\n");
  const char *funcname = get_name (current_function_decl);

  if(flag_dump_cs255_tree_gimple)
    {
      printf("++++GIMPLE TREE BEFORE CS255 PASS+++++\n");
      debug_function (current_function_decl, TDF_TREE);
    }

  count_static_bb_and_stmt();
//  if (strcmp (funcname,"increase"))
  count_dynamic_bb();
  output();

  if(flag_dump_cs255_tree_gimple)
    {
       printf("++++GIMPLE TREE AFTER CS255 PASS+++++\n");
       debug_function (current_function_decl, TDF_TREE);
    }
  return 0;
}

/***************** You should not modify below this line ***************/

bool flag_cs255 = false;
bool flag_dump_cs255_tree_gimple = false;

static void insert_init_and_report_calls(void) 
{
  const char *funcname = get_name (current_function_decl);

  basic_block bb;
//  init();
  //Call init() at the entry of the program
  if (!strcmp (funcname,"main"))
    {
      //printf("This is main function.\n");
 //     init();
      tree instm, r_init_decl, fname, ftype;
      fname = get_identifier (f_init);
      ftype = build_function_type (void_type_node, NULL);
      r_init_decl = build_decl (FUNCTION_DECL, fname, ftype);
      instm = build_function_call_expr (r_init_decl, NULL);  

      basic_block first_bb = ENTRY_BLOCK_PTR_FOR_FUNCTION(cfun)->next_bb;
      block_stmt_iterator bsi = bsi_start (first_bb);
      bsi_insert_before (&bsi, instm, TSI_SAME_STMT);
//      increase();
    }

  //Call output() at all exits of the program
  if (!strcmp (funcname,"main"))
    {
      //printf ("This is main function.\n");
      
      block_stmt_iterator bsi;

      //Call output before each return stmt in main function
      FOR_EACH_BB (bb)
      {
	for (bsi = bsi_start (bb); !bsi_end_p (bsi); bsi_next (&bsi))
	  {
	    if (TREE_CODE (bsi_stmt (bsi)) == RETURN_EXPR)
	      {
		tree instm, r_out_decl, fname, ftype;
		fname = get_identifier (f_out);
		ftype = build_function_type (void_type_node, NULL);
		r_out_decl = build_decl (FUNCTION_DECL, fname, ftype);
		instm = build_function_call_expr (r_out_decl, NULL); 
		bsi_insert_before (&bsi, instm, TSI_SAME_STMT);
                increase();
	      }
	  }
      }

      //Call output after the last stmt in main function if it is not a return stmt
      /* Deleted - a return stmt is added at the end of main function if it is a real
       * exit of the program.
       */
      /*
      basic_block last_bb = EXIT_BLOCK_PTR_FOR_FUNCTION(cfun)->prev_bb;
      bsi = bsi_last (last_bb);
      if (TREE_CODE (bsi_stmt(bsi)) != RETURN_EXPR)
	{
	  tree instm, r_out_decl, fname, ftype;
	  fname = get_identifier (f_out);
	  ftype = build_function_type (void_type_node, NULL);
	  r_out_decl = build_decl (FUNCTION_DECL, fname, ftype);
	  instm = build_function_call_expr (r_out_decl, NULL);  

	  bsi_insert_after (&bsi, instm, TSI_SAME_STMT);
	}
      */

      //Call output before each exit()
      FOR_EACH_BB (bb)
      {
	for (bsi = bsi_start (bb); !bsi_end_p (bsi); bsi_next (&bsi))
	  {
	    tree stmt = bsi_stmt(bsi);
	    if (TREE_CODE (stmt) == CALL_EXPR)
	      {
		tree callee_decl = get_callee_fndecl (stmt);
		const char *callee_name = get_name (callee_decl);
		//printf ("Callee: %s\n", callee_name);
		if(!strcmp (callee_name, "exit"))// the called function is exit()
		  {
		    tree instm, r_out_decl, fname, ftype;
		    fname = get_identifier (f_out);
		    ftype = build_function_type (void_type_node, NULL);
		    r_out_decl = build_decl (FUNCTION_DECL, fname, ftype);
		    instm = build_function_call_expr (r_out_decl, NULL); 
	    
		    bsi_insert_before (&bsi, instm, TSI_SAME_STMT);
 //                   increase();
		  }
	      }
	  }
      }
   }
}

/*  Used in the pass control mechanism to turn on or
 *  off this pass based on the command line argument.
 */
static bool gate_handle_cs255 (void)
{
  return flag_cs255 != false; 
}

/*  Dump how many basic blocks in a function and
 *  how many real statements (all except labels) in a basic block.
 */
static void count_static_bb_and_stmt (void)
{
  const char *funcname = get_name (current_function_decl);
  printf ("Function: %s\n", funcname);
 // init();
  int bb_counter = 0;
  basic_block bb;
  FOR_EACH_BB (bb)
  {
    bb_counter++;

    block_stmt_iterator bsi;
    int stmt_counter = 0;

    for (bsi = bsi_start (bb); !bsi_end_p (bsi); bsi_next (&bsi))
      {
	if (is_label_stmt (bsi_stmt (bsi)))
	  continue; // even unconditional goto is omitted
	stmt_counter++;
        increase();
      }
    printf ("\tNo.%d bb: %d statements.\n", bb_counter, stmt_counter);
  }
}



/*  The data structure needed for setting up the cs255 pass.
 */
struct tree_opt_pass pass_cs255 = 
{
  "cs255",                              /* name */
  gate_handle_cs255,                    /* gate */
  rest_of_handle_cs255,                 /* execute */
  NULL,                                 /* sub */
  NULL,                                 /* next */
  0,                                    /* static_pass_number */
  0,                                    /* tv_id */
  0,                                    /* properties_required */
  0,                                    /* properties_provided */
  0,                                    /* properties_destroyed */
  0,                                    /* todo_flags_start */
  0,                                    /* todo_flags_finish */
  0					/* letter */
};
