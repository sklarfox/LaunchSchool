require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def valid_integer?(num)
  num == num.to_i.to_s 
end

def valid_float?(num)
  num == num.to_f.to_s
end

def operation_to_message(op)
  selection = ''
  case op
  when '1'
    selection = 'Adding'
  when '2'
    selection = 'Subtracting'
  when '3'
    selection = 'Multiplying'
  when '4'
    selection = 'Dividing'
  end
  return selection
end

prompt (MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt (MESSAGES['name'])
  else
    break
  end
end

loop do # main loop
  digit1 = ''

  loop do
    prompt (MESSAGES['first_num'])
    digit1 = gets.chomp

    if valid_number?(digit1)
      break
    else
      prompt (MESSAGES['invalid_num'])
    end
  end

  digit2 = ''
  loop do
    prompt (MESSAGES['second_num'])
    digit2 = gets.chomp
    if valid_number?(digit2)
      break
    else
      prompt (MESSAGES['invalid_num'])
    end
  end

  prompt (MESSAGES['operator_prompt'])

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