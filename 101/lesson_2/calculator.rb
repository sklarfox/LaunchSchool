require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def prompt(message)
  puts "=> #{MESSAGES[LANGUAGE][message]}"
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
    selection = messages('adding')
  when '2'
    selection = messages('subtracting')
  when '3'
    selection = messages('multiplying')
  when '4'
    selection = messages('dividing')
  end
  selection
end

system('clear')

def messages(message)
  MESSAGES[LANGUAGE][message]
end

# Welcome user
prompt ('welcome')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt ('name')
  else
    break
  end
end

# Main calculator loop
loop do
  digit1 = ''

  # Collect first digit
  loop do
    prompt ('first_num')
    digit1 = gets.chomp

    if valid_number?(digit1)
      break
    else
      prompt ('invalid_num')
    end
  end

  # Collect second digit
  digit2 = ''
  loop do
    prompt ('second_num')
    digit2 = gets.chomp
    if valid_number?(digit2)
      break
    else
      prompt ('invalid_num')
    end
  end

  prompt ('operator_prompt')

  # Collect operator
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt ('must_choose')
    end
  end

  prompt "#{operation_to_message(operator)} #{messages('the_two_numbers')}"
  sleep 1

  # Calculate result
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

  # Give result
  prompt 'result' + result.to_s
  sleep 1

  # Ask for another calculation
  prompt 'again'
  answer = gets.chomp
  break unless answer.downcase == 'y' || answer.downcase == 'yes'
  system('clear')
end

# Thank user
prompt "#{messages('thanks_1')} #{name} #{messages('thanks_2')}"