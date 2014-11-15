require 'block'

class LVN
  attr_reader :orig, :redundant
  def initialize(stmts)
    @n2v, @orig = Hash.new, stmts
    @last_val = 0
    @redundant = [ ]
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
    v, found = vn_lookup( s.op1 )
    v2, found = vn_lookup( s.lhs )
    if v2 == v
      @redundant << s
    else
      @n2v[ s.lhs ] = v
    end
  end
    
  def vn_expr_stmt( s )
    v1, found = vn_lookup( s.op1 )
    v2, found = vn_lookup( s.op2 )
    expr = [v1, s.op, v2] * ' '
    v3, found = vn_lookup( expr )
    if found 
      if v3 == @n2v[ s.lhs ]
        puts "#{s} is redundant"
      else
        puts "#{[s.op1, s.op, s.op2] * ' '} is redundant"
      end
      @redundant << s
    end
    @n2v[ s.lhs ] = v3
  end

  def run_lvn
    @orig.code.each do |s|
      puts "analyze #{s}"
      if s.op == nil
        vn_copy_stmt( s )
      else
        vn_expr_stmt( s )
      end
    end
  end

end

class StewartVN < LVN
  def vn_expr_stmt( s ) 

  end
end
