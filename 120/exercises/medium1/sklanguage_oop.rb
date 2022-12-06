=begin
nouns:
  stack
  MiniLang
  - register (state of the stack, or is it its own object type)

verbs:
  n
  push
  add
  sub
  mult
  div
  mod
  pop
  print


=end

require 'pry'
require 'pry-byebug'

class MinilangError < StandardError; end
class InvalidToken < MinilangError; end
class EmptyStack < MinilangError; end

class Minilang
  VALID_TOKENS = [:push, :add, :sub, :mult, :div, :mod, :pop, :print]

  def initialize(input)
    @program = input
    @register = 0
    @stack = Array.new
  end

  def eval(input=nil)
    input ? formatted = format(@program, input).split : formatted = @program.split
    formatted.each do |token|
        if integer?(token)
          update_register(token.to_i)
        elsif !VALID_TOKENS.include?(token.downcase.to_sym)
          raise InvalidToken, "Invalid token:#{token}"
        else
          self.send(token.downcase.to_sym)
        end
      end
  end

  def integer?(input)
    input == input.to_i.to_s
  end

  def update_register(n)
    @register = n
  end

  def push
    @stack << @register
  end

  def add
    @register = @register + @stack.pop
  end

  def sub
    @register = @register - @stack.pop
  end

  def mult
    @register = @register * @stack.pop
  end

  def div
    @register = @register / @stack.pop
  end

  def mod
    @register = @register % @stack.pop
  end

  def pop
    raise EmptyStack, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def print
    begin
      raise EmptyStack if @register == nil
      puts "#{@register}"
    rescue MinilangError
      puts "Empty stack!"
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
# minilang.eval(degrees_c: 100)
# # 212
# minilang.eval(degrees_c: 0)
# # 32
# minilang.eval(degrees_c: -40)
# -40

# KILO * 3/5 = MILES
# 


# FAHRENHEIT_TO_CENTIGRADE = "9 PUSH 5 PUSH 32 PUSH %<degrees_f>d SUB MULT DIV PRINT"
# minilang = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
# minilang.eval(degrees_f: 212)
# minilang.eval(degrees_f: 32)
# minilang.eval(degrees_f: -40)

# KPH_TO_MPH = "5 PUSH 3 PUSH %<kph>s MULT DIV PRINT"
# minilang = Minilang.new(KPH_TO_MPH)
# minilang.eval(kph: 100)

RECTANGLE_AREA = "%<side1>d PUSH %<side2>d MULT PRINT"
minilang = Minilang.new(RECTANGLE_AREA)
minilang.eval({side1: 20, side2: 2})