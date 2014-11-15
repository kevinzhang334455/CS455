require 'block'
require 'test/unit'

class TestStmtBlock < Test::Unit::TestCase
  def setup
    @s1 = Stmt.new( "a", "b" )
    @s2 = Stmt.new( "c", "d", "-", "e" )
    @c1 = "a = b"
    @c2 = "c = d - e"
  end

  def test_stmt
    assert_equal @s1.gen_code, @c1
    assert_equal @s2.gen_code, @c2
  end

  def test_block
    basic = Block.new( "basic" ) do |b|
      b.code = [@s1,@s2]
      b.redundant = nil 
    end
    
    assert_equal basic.gen_code, "// code block basic\n#{@c1}\n#{@c2}\n"
  end
end
