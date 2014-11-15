require 'vn'

module CodeBlocks
  attr_reader :trivial
  def setup
    @trivial = Block.new( "trivial" ) do |b|
      s1 = Stmt.new( "a", "b", "+", "c" )
      s2 = Stmt.new( "a", "b", "+", "c" )
      b.code = [s1, s2]
      b.redundant = [s2]
    end

    @cocke_allen = Block.new( "Cocke Allen 1971" ) do |b|
      s1 = Stmt.new( "x", "a", "*", "b" )
      s2 = Stmt.new( "c", "a" )
      s3 = Stmt.new( "y", "c", "*", "b" )
      b.code = [s1, s2, s3]
      b.redundant = [s3]
    end

    @tricky = Block.new( "tricky" ) do |b|
      s1 = Stmt.new( "a", "b", "+", "c" )
      s2 = Stmt.new( "a", "c", "+", "b" )
      b.code = [s1, s2]
      b.redundant = [s2]
    end

    @intricate = Block.new( "intricate" ) do |b|
      s1 = Stmt.new( "e", "f", "+", "g" )
      s2 = Stmt.new( "h", "e", "-", "f" )
      b.code = [s1, s2]
      b.redundant = [s2]
    end
  end
end

describe "LVN#redundant" do
  include CodeBlocks

  it "solves the trivial case" do
    setup
    LVN.new( @trivial ).redundant.should eq( @trivial.redundant )
  end

  it "solves the cocke-allen example" do
    setup
    LVN.new( @cocke_allen ).redundant.should eq( @cocke_allen.redundant )
  end

  it "solves the tricky case" do
    setup
    LVN.new( @tricky ).redundant.should eq( @tricky.redundant )
  end

  it "solves the intricate case" do
    setup
    LVN.new( @intricate ).redundant.should eq( @intricate.redundant )
  end
end


