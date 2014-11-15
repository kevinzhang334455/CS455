Project 1: Value Numbering

Help Session and Due Time:  There will be a help session Friday 11 to 12pm in
601.  The project is due midnight on the same day (January 31).

You are to extend the value numbering algorithm and implement your extension.
You should use the Ruby code used in Monday's class and given in the class
repository.

* Requirement

You are required to improve value numbering so it can identify redundancy in
the intricate case give in [repos]/reading/04-lvn-code/vn_tests.rb: 

  e = f + g 
  h = e - f

The idea of the solution was first raised by Chris Stewart when he was taking
the class around 2004.  His idea was to insert additional value relations into
the value number table.  You should first work out this idea and make it
concrete as an extension to the basic value numbering algorithm.

To implement your extension, take the following steps:

1. If you haven't done so, create a branch in the class repository named by your
user id (use branch in Mercurial) 
2. Create your project directory [repos]/assignments/1-lvn/[your user id]/ .  
3. Copy block.rb, vn.rb and vn_tests.rb to your project directory.  
4. In vn.rb, add a subclass of LVN. Implement your extension in the subclass.  
Call the class StewartVN or any name of your choice.  
5. In vn_tests.rb, change the tests to use your class instead of LVN.  
6. Make sure all the tests pass.  
7. Document any test failures, if there is any, and explain why, in README.txt 
in plain text.

- Extra Credit 
You may go beyond the above requirement and create further extensions.  Explain 
the extensions and add test cases in vn_tests.rb to demonstrate.
 
* File submission

Push ('hg push') your project directory into the central repository on
cycle1.csug or cycle1.cs by the deadline. Delete intermediate files ('hg
remove') in your project directory before the submission.

