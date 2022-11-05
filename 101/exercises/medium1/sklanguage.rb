require 'pry'
require 'pry-byebug'

def integer?(input)
  input.to_i.to_s == input
end


def minilang(input)
  commands = input.split
  register = 0
  stack = []

  commands.each do |command|
    # binding.pry
    if integer?(command)
       register = command.to_i
       next
    end

    case command
    when 'PUSH' then stack.push(register)
    when 'ADD' then register = register + stack.pop
    when 'SUB' then register = register - stack.pop
    when 'MULT' then register = register * stack.pop
    when 'DIV' then register = register / stack.pop
    when 'MOD' then register = register % stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    else
      puts 'INVALID COMMAND'
    end
  end
  nil
end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')


#(3 + (4 * 5) - 7) / (5 % 3)

#3 push 5 mod push 3 push 4 push 5 mult add push 7 sub div 