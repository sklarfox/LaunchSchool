require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def prompt(message)
  puts "=> #{message}"
end

def messages(message, lang='en')
  MESSAGES[lang][message]
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
    selection = messages('adding', LANGUAGE)
  when '2'
    selection = messages('subtracting', LANGUAGE)
  when '3'
    selection = messages('multiplying', LANGUAGE)
  when '4'
    selection = messages('dividing', LANGUAGE)
  end
  selection
end

system('clear')

# Welcome user
prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(messages('name', LANGUAGE))
  else
    break
  end
end

# Main calculator loop
loop do
  digit1 = ''

  # Collect first digit
  loop do
    prompt(messages('first_num', LANGUAGE))
    digit1 = gets.chomp

    if valid_number?(digit1)
      break
    else
      prompt(messages('invalid_num', LANGUAGE))
    end
  end

  # Collect second digit
  digit2 = ''
  loop do
    prompt(messages('second_num', LANGUAGE))
    digit2 = gets.chomp
    if valid_number?(digit2)
      break
    else
      prompt(messages('invalid_num', LANGUAGE))
    end
  end

  prompt(messages('operator_prompt', LANGUAGE))

  # Collect operator
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('must_choose', LANGUAGE))
    end
  end

  prompt "#{operation_to_message(operator)} #{messages('the_two_numbers', LANGUAGE)}"
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
  puts "=> #{messages('result', LANGUAGE)} #{result}"
  sleep 1

  # Ask for another calculation
  prompt(messages('again', LANGUAGE))
  answer = gets.chomp
  break unless answer.downcase == 'y' || answer.downcase == 'yes'
  system('clear')
end

# Thank user
prompt "#{messages('thanks_1', LANGUAGE)} #{name}#{messages('thanks_2', LANGUAGE)}"
