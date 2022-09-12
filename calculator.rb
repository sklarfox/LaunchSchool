def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

prompt "=> Welcome to Calculator!"

loop do
  prompt "What's the first number?"
  digit1 = gets.chomp

  if valid_number?(digit1)
    break
  else
    prompt "Hmm... that doesn't look like a valid number"
  end
end

prompt "What's the second number?"
digit2 = gets.chomp

prompt 'Please give an operation: 1) add 2) subtract 3) multiply 4) divide '
operator = gets.chomp

result = case operator
         when '1'
          digit1.to_i + digit2.to_i
         when '2'
          digit1.to_i - digit2.to_i
         when '3'
          digit1.to_i * digit2.to_i
         when '4'
          digit1.to_f * digit2.to_f
         end

prompt "The result is #{result}"
