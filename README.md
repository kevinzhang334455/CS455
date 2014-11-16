urcc_compiler
=============

Because cs455 has a mercury node, so I copied all data to github, the project works then.

cs455/urcc is our compiler optimization project, the origin author is Prof. Chen Ding. I added control flow graph, dead code elimination as course project. the source file is /cs455/urcc/ast/cfg.rb, and the pass file is cfg in cs455/assignments/3_vn/base directory

Usage: 

1. cd cs455/assignments/3_vn/base

2. chmod +x inst_count (make sure rspec work, sudo apt-get install rspec)

3. ./inst_count ../../test_cases/file_name


