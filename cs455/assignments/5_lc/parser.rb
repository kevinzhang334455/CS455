# Code by Sean Brennan for CSC 255
# Extra notes added by Brian Gernhardt for CSC 253

# You can use the parser as follows:
#
# require '../parser'
# code = gets
# code = LambdaParser.new.run code
# eval(code)
#
# Note:
#   gets gets input from the user
#   eval() is your function to run a piece of code
#
# The return value from LambdaParser.run is a tree of LambdaNodes (see the
# end of the file).  The parser can not be re-used for multiple pieces of
# code, create a new one each time.

# The syntax of the parser is inspired by Ruby procs.  An expression can be
# one of the following:
#
#   foo    = Variable, all lowercase
#   BAR2   = Constant, uppercase letters and numbers
#   42     = Constant, all numbers
#
#   {|x| x} = Lamda definition.
#         One variable between ||s, one expression after
#         { | <variable> | <expression> }
#
#   (id 1) = Lambda application
#         Two expressions between parentheses
#         ( <expression> <expression> )

$debug = {
  :LambdaScanner => {
    :scan => false
  },
  :LambdaParser => {
    :run => false,
    :match => false
  },
  :LambdaNode => {
    :initialize => false
  },
  :LambdaEvaluator => {
    :run => false,
    :eval => false
  }
}

module Debug
  def dputs(msg, c, m)
    puts msg if $debug[c][m]
  end
end

include Debug

module LambdaScanner
  # tokens:
  # { } | ( ) 
  # <sym>: [a-z]+
  TOKENS = [:sym, :con, :lpar, :rpar, :pipe, :lbrace, :rbrace, :end]
  
  def scan
    @token_image = ""
    
    while @input[@cursor,1] =~ /\s/ do
      @cursor += 1
    end
    
    if @cursor >= @input.length then
      dputs("\t\tEnd of input.", :LambdaScanner, :scan)
      return :end
    end
    
    dputs("\t\tInput symbol: #{@input[@cursor,1]}", :LambdaScanner, :scan)
    dputs("\t\tCursor: #{@cursor}, Input Length: #{@input.length}", :LambdaScanner, :scan)
    case
    when @input[@cursor,1] =~ /[a-z]/
      while @input[@cursor,1] =~ /[a-z]/
        @token_image += @input[@cursor,1]
        @cursor += 1
      end
      return :sym
    when @input[@cursor,1] =~ /[A-Z0-9]/
      while @input[@cursor,1] =~ /[A-Z0-9]/
        @token_image += @input[@cursor,1]
        @cursor += 1
      end
      return :con
    when (@input[@cursor,1] == '\n' or @input[@cursor,1] == '\r')
      @cursor += 1
      return :end
    else
      case
      when @input[@cursor,1] == "{"
        @cursor += 1
        return :lbrace
      when @input[@cursor,1] == "}"
        @cursor += 1
        return :rbrace
      when @input[@cursor,1] == "("
        @cursor += 1
        return :lpar
      when @input[@cursor,1] == ")"
        @cursor += 1
        return :rpar
      when @input[@cursor,1] == "|"
        @cursor += 1
        return :pipe
      else
        raise "ERROR: unexpected input character #{@input[@cursor,1]}"
      end
    end
  end
end

class LambdaParser
  # P    => EXPR $
  # EXPR => S
  #      => {|<sym>| EXPR}
  #      => (EXPR EXPR)
  # S => <sym>
  #   => <con>
  # predict(EXPR) = [<sym>, <con>, {, (]
  # predict(S)    = [<sym>, <con>]
  include LambdaScanner
  
  attr_accessor :input
  attr_accessor :token
  
  def initialize
    @input = nil
    @token = nil
    @token_image = ""
    @cursor = 0
  end
  
  def parse_program
    text = ""
    
    case @token
    when :sym, :con, :lambda, :lpar
      parse_expr
      match(:end)
    else
      raise "ERROR: unexpected form of program"
    end
  end
  
  def parse_expr
    text = ""
    
    case @token
    when :sym, :con
      dputs("\t\tFound #{@token}.", :LambdaParser, :run)
      node = parse_sym
      dputs("\t\t\ttext: #{node.text}", :LambdaParser, :run)
      return node
    when :lbrace
      match(:lbrace)
      text += "{"
      match(:pipe)
      text += "|"
      chsym = @token_image
      text += @token_image
      match(:sym)
      match(:pipe)
      text += "| "
      chexpr = parse_expr
      text += chexpr.text
      match(:rbrace)
      text += " }"
      return LambdaDefinition.new(text, chsym, chexpr)
    when :lpar
      match(:lpar)
      text += "("
      chexpr1 = parse_expr
      text += chexpr1.text
      chexpr2 = parse_expr
      text += (" "  + chexpr2.text)
      match(:rpar)
      text += ")"
      return LambdaApplication.new(text, chexpr1, chexpr2)
    else
      raise "ERROR: unexpected form of lambda expression."
    end

    return true
  end
  
  def parse_sym
    text, type = "", (@token == :sym ? :variable : :constant)
    
    case @token
    when :sym
      text += @token_image
      match(:sym)
      #dputs("\t\t\tToken image: #{@token_image}", :LambdaParser, :run)
      return LambdaVariable.new(text)
    when :con
      text += @token_image
      match(:con)
      return LambdaConstant.new(text)
    else
      raise "ERROR: unexpected form of symbol expression."
    end
  end
  
  def match(expected)
    if @token == expected then
      dputs("\t\tMatched token of type #{expected}. Token image: #{@token_image}", :LambdaParser, :match)
      @token = scan
    else
      raise "ERROR: unexpected token: #{@token} for #{expected}"
    end
  end
  
  def run(input)
    dputs("Input: #{input}", :LambdaParser, :run)
    @input = input
    @token = scan
    
    begin
      return parse_expr
    rescue => e
      puts "\t#{e.message}"
      return nil
    end
  end
end

class LambdaNode
  attr_accessor :text
  
  def initialize(text)
    @text = text
  end
end

class LambdaVariable < LambdaNode
  def initialize(name)
    super(name)
    dputs("\t\tNew variable: #{text}", :LambdaNode, :initialize)
  end
end

class LambdaConstant < LambdaNode
  def initialize(name)
    super(name)
    dputs("\t\tNew constant: #{text}", :LambdaNode, :initialize)
  end
end

class LambdaDefinition < LambdaNode
  attr_accessor :variable
  attr_accessor :expression
  
  def initialize(text, var, expr)
    super(text)
    @variable = var
    @expression = expr
    dputs("\t\tNew definition: #{text}", :LambdaNode, :initialize)
  end
end

class LambdaApplication < LambdaNode
  attr_accessor :left
  attr_accessor :right
  
  def initialize(text, left, right)
    super(text)
    @left = left
    @right = right
    dputs("\t\tNew application: #{text}", :LambdaNode, :initialize)
  end
end

class LambdaClosure < LambdaNode
  attr_accessor :expression
  attr_accessor :context
  
  def initialize(expr, ctxt)
    super(text)
    @expression = expr
    @context = ctxt
  end
end

