#!/usr/bin/ruby

require_relative "./ast_scope.rb"
require_relative "./ast_stat.rb"

module Ast
  class Cfg < Node
    attr_reader :leader, :last, :bb_array

    def initialize()
      @leader = Hash.new
      @leader_label = Hash.new
      @last = Array.new
      @bb_array = Array.new
      @nxt = 1
      @pred_index = 0
      @use_global = Hash.new
      @worklist = Array.new
    end

    def find_leader(scope)
      level = 0
      @leader[0] = 0
      scope.children.each do |s|
        find_leader(s) if (s.class.to_s == "Ast::Func" or s.class.to_s =="Ast::Scope" or s.class.to_s == "Ast::Block")
        if s.class.to_s == "Ast::LabelStat"
          @leader[@nxt] = level
          @nxt = @nxt + 1
          @leader_label[level] = s.c_dump.slice(/lbl_[\d]+/) if (s.c_dump.slice(/lbl_[\d]+/) != nil) 
        end
        level = level + 1
      end
    end

    def find_last(scope)
      level = 0
      curr_leader_index = -1
      scope.children.each do |s|
        find_last(s) if (s.class.to_s == "Ast::Func" or s.class.to_s == "Ast::Scope" or s.class.to_s == "Ast::Block")
        if @leader.has_value?level
          curr_leader_index = curr_leader_index + 1
          bb = Bb.new(curr_leader_index)
          bb.instrs_push(s)
          @bb_array.push bb
          last_index = level-1
          @last.push last_index if last_index > -1
        else
          @bb_array.at(curr_leader_index).instrs_push(s)             
        end
        level = level + 1
      end
      last_index = level-1
      @last.push last_index      
    end

    def build_edge(scope)
      level = 0
      scope.children.each do |s|
        build_edge(s) if (s.class.to_s == "Ast::Func" or s.class.to_s == "Ast::Scope" or s.class.to_s == "Ast::Block")
      @pred_index = @leader.key(level) if @leader.has_value?level #update @pred_index
      if s.class.to_s == "Ast::GotoStat"
        str = s.c_dump.to_s.split(";")
        str1 = str[0]
        str2 = str[1]
        str1 = str1.slice(/lbl_[\d]+/)
        str2 = str2.slice(/lbl_[\d]+/)
        if (str1 != nil)
         @succ_index = @leader.key(@leader_label.key(str1))
         @bb_array.at(@succ_index).predessors.push @pred_index
         @bb_array.at(@pred_index).successors.push @succ_index
       end
       if (str2 != nil)
         @succ_index = @leader.key(@leader_label.key(str2))
         @bb_array.at(@succ_index).predessors.push @pred_index
         @bb_array.at(@pred_index).successors.push @succ_index
       end
     end
     level = level+1
   end
 end


  def cal_reaching_def()
    @bb_array.each do |b|
      b.cal_init_dk
      b.cal_use
    end

    @changed = 1
     while (@changed == 1)
     @changed = 0
     # puts "changed: #{@changed}"
     @bb_array.each do |b|
       # puts "new_reaches: #{new_reaches}"
       b.predessors.each do |p|
       @bb_array.at(p).reaches.each do |k1, v1|
        # puts "k1: #{k1}, v1: #{v1}"
        # puts "#{b.reaches[k1]}"
        if v1.is_a?Array and not @bb_array.at(p).defout.has_key?(k1)
          if not b.reaches.has_key?(k1)
            b.reaches[k1] = v1
            @changed = 1
          else
            v1.each do |v|
              if not b.reaches[k1].include?(v)
                b.reaches[k1].push v 
                @changed = 1
              end
            end
          end
        end
      end

      @bb_array.at(p).defout.each do |k3, v3|
         if not b.reaches.has_key?(k3)
           b.reaches[k3] = Array.new
           b.reaches[k3].push v3
           @changed = 1
         else
           if not b.reaches[k3].include?(v3)
             b.reaches[k3].push v3
             @changed = 1
           end 
         end
      end

     end # do p
   end #do b

 end # while
 # @bb_array.reverse.each do |b|
 #   b.print_reaches
 # end
 @bb_array.each do |b|
   b.cal_UD_chain
 end
 # @bb_array.reverse.each do |b|
 #  b.print_UD_chain
 # end
end #end of method

 def copy_local_to_global
  @bb_array.reverse.each do |b|
    b.use.each { |u, d|
      if not @use_global.has_key?(u)
        @use_global[u] = d
      else
        d.each do |v|
          @use_global[u].push v if not @use_global[u].include?(v)
        end
      end
    }
  end
end

def print_global_use
  puts "use_global print: "
  @use_global.each { |u, d|
    d.each do |v|
    puts "use #{u} -- def #{v.c_dump}"
    end
  puts " "
  }
  end

  def cal_DDE 
    @bb_array.reverse.each do |b|
      b.instrs.reverse.each do |i|
        if i.is_a?Ast::ReturnStat or i.is_a?Ast::GotoStat or i.is_a?Ast::LabelStat
          i.tags["mark"] = true
          @worklist.push i if not @worklist.include?(i)
        end
        if i.is_a?Ast::AssignStat and i.rhs.is_a?Ast::Call
          i.tags["mark"] = true if not i.tags.has_key?("mark")
          @worklist.push i if not @worklist.include?(i)
        end
        if i.is_a?Ast::AssignStat and i.lhs != nil
	  if i.rhs.c_dump.slice("&") != nil or i.lhs.dim > 0 or i.lhs.is_a?Ast::DerefAcc
	    i.tags["mark"] = true 
	    # puts "#{i.c_dump}"
            @worklist.push i if not @worklist.include?(i)
          end   
        end
        i.tags["mark"] = false if not i.tags["mark"] == true
      end #end of tranversing instructions within a block
    end #end of tranversing basic block, find initial list of working list

 #   @worklist.each do |w|
#	puts "#{w.c_dump}"
 #   end


    while ((s = @worklist.shift) != nil)
     # puts "#{s.c_dump}"
      if s.is_a?Ast::GotoStat
        str = s.c_dump.split(";")
        str = str[0].slice(/var_[\d|\w]+/)
        # puts "#{str}"
        if (str != nil)
          @use_global[str].each do |v|
            @worklist.push v if not @worklist.include?(v) and v.tags["mark"] == false
            # puts "breakpoint 1"
            v.tags["mark"] = true
          end
        end

    end
    
    if s.is_a?Ast::ReturnStat
      str = s.c_dump
      str = str.slice(/var_[\d|\w]+/)
        # puts "#{str}"
        if (str != nil)
          @use_global[str].each do |v|
            @worklist.push v if not @worklist.include?(v) and v.tags["mark"] == false
           # puts "breakpoint 2"
            v.tags["mark"] = true
          end
        end
    end

    if s.is_a?Ast::AssignStat
 

       if s.rhs.is_a?Ast::Call
         s.rhs.each do |c|
           str = c.c_dump.slice(/var_[\d|\w]+/)
           if (str != nil)
            @use_global[str].each do |v|
              @worklist.push v if not @worklist.include?(v) and v.tags["mark"] == false
              v.tags["mark"] = true
              end
            end
         end
       end


       if s.rhs.is_a?Ast::OpExpr
        #  puts "#{s.rhs.c_dump}"
      if (str = s.rhs.c_dump.slice("&")) != nil
#	   puts "!!!!!!!!!!!!!!!!!!!!!#{s.rhs.class.to_s} #{s.rhs.rand1.c_dump}" #{s.rhs.rand2.c_dump}
           str = s.rhs.c_dump.slice(/var_[\d]+/)
             # puts "label::::#{str}"
             if (str != nil and @use_global[str] != nil)
               @use_global[str].each do |v|
               @worklist.push v if not @worklist.include?(v) and v.tags["mark"] == false
               v.tags["mark"] = true
             end
           end
        # end
       else
         str1 = s.rhs.rand1.c_dump.slice(/var_[\d|\w]+/)
         str2 = s.rhs.rand2.c_dump.slice(/var_[\d|\w]+/) if s.rhs.rand2 != nil
         if (str1 != nil)
          @use_global[str1].each do |v|
            @worklist.push v if not @worklist.include?(v) and v.tags["mark"] == false
            v.tags["mark"] = true
          end
         end
         if (str2 != nil)
           @use_global[str2].each do |v|
            @worklist.push v if not @worklist.include?(v) and v.tags["mark"] == false
            v.tags["mark"] = true
          end
         end
        end  
       end

       if s.rhs.is_a?Ast::VarAcc
         str = s.rhs.c_dump.slice(/var_[\d|\w]+/)
         # puts "cut slice: #{str}"
         if (str != nil) # and @use_global[str] != nil
          @use_global[str].each do |v|
            @worklist.push v if not @worklist.include?(v) and v.tags["mark"] == false
            v.tags["mark"] = true
          end
        end
      end

     end #end for Assignment
     # puts "infinite loop?"
    end #end of while
  
  end #end of method

  def eliminate_code 
    @bb_array.each do |b|
      b.instrs.each do |i|
	if i.tags["mark"] == false
          puts "detached: #{i.c_dump}"
	 # puts "#{i.lhs.class.to_s}"
          #puts "dim: #{i.lhs.dim}"
	  i.detach_me 
        end
      end
    end
  end



end #end of class

class Stmt
  attr_accessor:op1, :op, :op2, :lhs

  def initialize (s)
    if s.lhs == nil
      @op1 = s.rhs
      @op = nil
      @op2 = nil
      @lhs = nil
    else
     @lhs = s.lhs
     if s.rhs.is_a?Ast::Const
       @op1 = s.rhs
       @op = nil
       @op2 = nil
     elsif s.rhs.is_a?Ast::OpExpr
       @op1 = s.rhs.rand1
       @op2 = s.rhs.rand2
       @op = s.rhs.rator
     else
       @lhs = nil
       puts "this expr cannot be value numbering"
       return -1
     end
   end
 end

end

class Bb
 attr_accessor :predessors, :successors, :id, :reaches, :defout, :killset, :varkill, :use, :instrs

 def initialize(id)
   @predessors = Array.new
   @successors = Array.new
   @instrs = Array.new
   @id = id
   @n2v = Hash.new
   @last_val = 0
   @redundant = [ ]
   @expr_save = [ ]
   @reaches = Hash.new;
   @defout = Hash.new;
   @killset = Hash.new;  
   @varkill = Hash.new;
   @use = Hash.new; #this is use-def chain
 end

 def cal_init_dk #calculate defout, killset
   @instrs.reverse.each { |s|
   next if not s.class.to_s == "Ast::AssignStat"
        # puts "#{s.c_dump}, #{s.class.to_s}"
        if s.lhs != nil
          @defout[s.lhs.c_dump] = s if not @defout.has_key?(s)
          @varkill[s.lhs.c_dump] = s.rhs.c_dump if @varkill[s.lhs.c_dump] == nil #we only get the latest def in a block
        end
  }
     instrs.each do |s|
      next if not s.class.to_s == "Ast::AssignStat"
        if s.lhs != nil
        if @varkill[s.lhs.c_dump] != nil and s.rhs.c_dump != @defout[s.lhs.c_dump]  #left hand side as key, convenient for calculating
          @killset[s.lhs.c_dump] = Array.new if not @killset.has_key?(s.lhs.c_dump)
          @killset[s.lhs.c_dump].push s.rhs.c_dump
        end 
      end
    end
  end

  def print_instrs
    @instrs.each do |i|
      puts "instr: #{i.c_dump}"
    end
  end

    def print_killset
    @killset.each do |i|
      puts "instr: #{i}"
    end
  end


 def cal_use
  @instrs.reverse.each do |s|

    if s.is_a?Ast::GotoStat
        str = s.c_dump.split(";")
        str = str[0].slice(/var_[\d|\w]+/)
# 	puts "RE: #{str}"
        if (str != nil)
          @use[str] = Array.new if @use[str] == nil
        end
    end
    
    if s.is_a?Ast::ReturnStat
      str = s.c_dump
      str = str.slice(/var_[\d|\w]+/)
        if (str != nil)
          @use[str] = Array.new if not @use.has_key?(str)
        end
    end

    if s.is_a?Ast::AssignStat
       # puts "rhs print: #{s.rhs.c_dump}"
       if s.rhs.is_a?Ast::Call
         s.rhs.each do |c|
           str = c.c_dump.slice(/var_[\d|\w]+/)
	   if (str != nil)
             @use[str] = Array.new if not @use.has_key?(str)
           end
         end
       end
       if s.rhs.is_a?Ast::OpExpr
        #  puts "#{s.rhs.c_dump}"
         str = s.rhs.rand1.c_dump.slice(/var_[\d]+/)
         str1 = s.rhs.rand1.c_dump.slice(/var_[\d|\w]+/)
         str2 = s.rhs.rand2.c_dump.slice(/var_[\d|\w]+/) if s.rhs.rand2 != nil
         if (str != nil)
           @use[str] = Array.new if not @use.has_key?(str)
         end
         if (str1 != nil)
           @use[str1] = Array.new if not @use.has_key?(str1)
         end
         if (str2 != nil)
          @use[str2] = Array.new if not @use.has_key?(str2)
         end  
       end
       if s.rhs.is_a?Ast::VarAcc
	       str = s.rhs.c_dump.slice(/var_[\d|\w]+/)
             #  puts "cut slice: #{str}"
         if (str != nil)
           @use[str] = Array.new if not @use.has_key?(str)
         end
       end
     end #end for Assignment
  end # end for each
end #end for method



 def cal_UD_chain
  @use.each{ |u, d|
   #  puts "key: #{u}"
    if @defout.has_key?(u) # and not @use[u].include?(@defout[u])
        @use[u].clear
    	@use[u].push @defout[u] 
    end
    if @reaches[u] != nil #not @defout.has_key?(u) and
      @reaches[u].each do |v|
      @use[u].push v if not @use[u].include?(v)
      end
    end 
  }
  end

  def print_reaches
    @reaches.each { |u, d|
    d.each do |i|
    puts "reaches key: #{u}, reaches value #{i.c_dump}"
    end
  }
  end

  def print_defout
    @defout.each do |i, v|
      puts "defout: k: #{i}, v: #{v}"
    end
  end

  def print_UD_chain
    @use.each { |use, definition|
      definition.each do |d|
      puts "bb#{id}: #{use} -- #{d.rhs.c_dump}"
      end
    }
  end


 def vn_lookup( str )
  return @n2v[str], true if @n2v[str] != nil
  @last_val = @last_val + 1
  @n2v[str] =  @last_val
  return @last_val, false
end

def vn_copy_stmt( s )
  puts "this is a copy statement"
  v1, v1_status = vn_lookup( s.op1 )
  @n2v[s.lhs] = v1
end

def vn_expr_stmt( s )
  puts "this is a expression statement"
  v1, v1_status = vn_lookup( s.op1 )
  v2, v2_status = vn_lookup( s.op2 )
  v3, v3_status = vn_lookup ( s.lhs )
  expr = String.new("#{v1}" + "#{s.op}" + "#{v2}")
  puts "#{v1} #{s.op} #{v2} -> #{v3}"
  expr_reverse = String.new("#{v2}" + "#{s.op}" + "#{v1}")
  if (s.op == "+")
    expr_v1 = String.new("#{v3}" + "-" + "#{v2}")
    puts "equal expression 1: #{v3} - #{v2} -> #{v1}"
    expr_v2 = String.new("#{v3}" + "-" + "#{v1}")
    puts "equal expression 2: #{v3} - #{v1} -> #{v2}"
  elsif (s.op == "-")
    expr_v1 = String.new("#{v3}" + "+" + "#{v2}")
    puts "equal expression 1: #{v3} + #{v2} -> #{v1}"
    expr_v2 = String.new("#{v1}" + "-" + "#{v3}")
    puts "equal expression 2: #{v1} - #{v3} -> #{v2}"      
  end
  @expr_save.each do |exp|
    if ( expr == exp  || expr_reverse == exp)
     @redundant = @redundant + [s]
     puts "this statement is redundant"
        # return "this statement is redundant"
      end
    end
    @expr_save = @expr_save + [expr]
    @expr_save = @expr_save + [expr_v1]
    @expr_save = @expr_save + [expr_v2]    
  end

  def instrs_push(instr)
   @instrs.push instr
 end

 def print_info()
   puts "basic block #{@id.to_s}:"
   print "predessors: "
   self.print_pred()
   print "\n"
   print "successors: "
   self.print_succ()
   print "\n\n"
 end

 def print_pred()
   @predessors.each do |p|
     print "#{p.to_s} "
   end
 end

 def print_succ()
   @successors.each do |s|
     print "#{s.to_s} "
   end
 end

 def lvn()
   @instrs.each do |i|
     next if not i.is_a?Ast::AssignStat
     next if i.rhs.is_a?Ast::Call
     s = Stmt.new(i)
     puts "Analysis #{i.c_dump}"
     if (s.op == nil)
      vn_copy_stmt(s)
    else
      vn_expr_stmt(s)
    end
  end
end

end   #end of class

end  #end of Module
