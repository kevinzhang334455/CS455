#!/usr/bin/ruby

require_relative './parser.rb'

def eval (code, env)
	if code.is_a? LambdaDefinition
		puts "eval function: #{code.text}"
		# env[code.variable] = code.text
		@closure = LambdaClosure.new(code, env)
		puts "eval result, a closure:  "
		return @closure
	elsif code.is_a? LambdaApplication
		#puts "left: #{code.left}"
		m = eval(code.left, env)
		puts "M1 eval result: #{m.text}" if m!=nil
		param = eval(code.right, env)
		puts "M2 eval result #{param.text}" if param!=nil
		if m != nil and not m.is_a?LambdaClosure
		  env[m.text] = param
          puts "binding #{m.text} to #{param}"
		  r = eval(m, env) 
          puts "M3 eval result: #{r.text}"
        end
	elsif code.is_a? LambdaVariable
	        puts "eval variable: #{code.text}"
		puts "eval result: "
		return env[code.text]
	elsif code.is_a? LambdaConstant
		return code
	else raise "ERROR: unexpected evaluation type #{code}"
	end
end
			
puts "test case 1: LambdaDefinition"
code = "{ |x| x }"
puts "#{code}"
@code = LambdaParser.new.run code
@env = Hash.new
eval(@code, @env)
puts ""

puts "test case 2: LambdaApplication"
code = "(M1 M2)"
puts "#{code}"
@code = LambdaParser.new.run code
@env = Hash.new
eval(@code, @env)
puts ""
puts "test case 3: LC Mixed 1"
code = "({ |x| 2 } 3)"
puts "#{code}"
@code = LambdaParser.new.run code
@env = Hash.new
eval(@code, @env)
puts ""
puts "test case 4: LC Mixed 2"
code = "((({|x| x} 1) {|y| y}) z)"
puts "#{code}"
@code = LambdaParser.new.run code
@env = Hash.new
eval(@code, @env)
puts ""
