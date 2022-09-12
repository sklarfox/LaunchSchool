def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt "=> Welcome to Calculator! Enter your name: "

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end


loop do # main loop
  digit1 = ''

  loop do
    prompt "What's the first number?"
    digit1 = gets.chomp

    if valid_number?(digit1)
      break
    else
      prompt "Hmm... that doesn't look like a valid number"
    end
  end

  digit2 = ''
  loop do
  prompt "What's the second number?"
  digit2 = gets.chomp

    if valid_number?(digit2)
      break
    else
      prompt "Hmm... that doesn't look like a valid number"
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Must choose 1, 2, 3, or 4"
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
          when '1'
            digit1.to_i + digit2.to_i
          when '2'
            digit1.to_i - digit2.to_i
          when '3'
            digit1.to_i * digit2.to_i
          when '4'
            digit1.to_f / digit2.to_f
          end

  prompt "The result is #{result}"

  prompt "Do you want to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thank you for using the calculator. Good bye!"