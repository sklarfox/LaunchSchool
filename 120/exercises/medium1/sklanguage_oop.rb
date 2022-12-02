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
    @program = input.split
    @register = 0
    @stack = Array.new
  end

  def eval
    begin
      @program.each do |token|
          if integer?(token)
            update_register(token.to_i)
          elsif !VALID_TOKENS.include?(token.downcase.to_sym)
            @invalid = token
            raise InvalidToken
          else
            self.send(token.downcase.to_sym)
          end
        end
    rescue MinilangError
      puts "Invalid Token: #{@invalid}"
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

# Minilang.new('PRINT').eval
# 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

# Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
