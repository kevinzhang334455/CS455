require 'block'

module S12
  def setup
    @s1 = Stmt.new( "a", "b" )
    @s2 = Stmt.new( "c", "d", "-", "e" )
    @c1 = "a = b"
    @c2 = "c = d - e"
  end
end

describe ".gen_code" do
  include S12

  it "should generate statement code" do
    setup
    @s1.gen_code.should eq( @c1 )
    @s2.gen_code.should eq( @c2 )
  end

  it "should generate code block" do
    setup
    basic = Block.new( "basic" ) do |b|
      b.code = [@s1,@s2]
      b.redundant = nil 
    end
    
    basic.gen_code.should eq( "// code block basic\n#{@c1}\n#{@c2}\n" )
  end
end
