require_relative 'block'

class LVN
  attr_reader :orig, :redundant
  def initialize(stmts)
    @n2v, @orig = Hash.new, stmts
    @last_val = 0
    @redundant = [ ]
    @expr_save = [ ]
    run_lvn
  end

  private
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
        return "this statement is redundant"
      end
    end

	@expr_save = @expr_save + [expr]
        @expr_save = @expr_save + [expr_v1]
        @expr_save = @expr_save + [expr_v2]    
  end

  def run_lvn
    @orig.code.each do |s|
      puts "analyze #{s}\n"
      if (s.op == nil) 
        vn_copy_stmt( s )
      else
        vn_expr_stmt( s )
      end
   end
  end
end
