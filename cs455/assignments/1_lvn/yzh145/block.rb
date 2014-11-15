class Stmt
  attr_reader :lhs, :op1, :op, :op2

  def initialize( lhs, op1, op=nil, op2=nil )
    @lhs, @op1, @op, @op2 = lhs, op1, op, op2
    return self
  end

  def gen_code
    return "#{@lhs} = #{@op1}" if @op==nil
    return "#{@lhs} = #{@op1} #{@op} #{@op2}"
    # return [@lhs, @op1, @op, @op2] * ' '
  end

  alias_method :to_s, :gen_code

  def ==(t)
    return to_s == t.to_s
    # [@lhs, @op1, @op, @op2] == [t.lhs, t.op1, t.op, t.op2]
  end
end

class Block
  attr_accessor :name, :code, :redundant

  def initialize( name )
    @name = name
    yield self
  end
    
  def gen_code
    block = '// ' + "code block #{@name}\n" + @code.collect{ |stmt| stmt.to_s + "\n" }.to_s
    return block
  end

  alias_method :to_s, :gen_code

end
