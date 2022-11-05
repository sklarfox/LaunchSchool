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

def collect_digit(prompt)
  digit = ''
  loop do
    prompt(messages(prompt, LANGUAGE))
    digit = gets.chomp
    if valid_number?(digit)
      break
    else
      prompt(messages('invalid_num', LANGUAGE))
    end
  end
  digit
end

def convert_digit(digit)
  if digit.include?('.')
    digit.to_f
  else
    digit.to_i
  end
end

system('clear')

# Welcome user
prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = gets.chomp.strip

  if name.empty?
    prompt(messages('name', LANGUAGE))
  else
    break
  end
end

# Main calculator loop
loop do
  # Collect digits
  digit1 = collect_digit('first_num')
  digit2 = collect_digit('second_num')

  # Collect operator
  prompt(messages('operator_prompt', LANGUAGE))
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('must_choose', LANGUAGE))
    end
  end

  prompt "#{operation_to_message(operator)}" \
  "#{messages('the_two_numbers', LANGUAGE)}"

  sleep 1

  # Calculate result
  digit1 = convert_digit(digit1)
  digit2 = convert_digit(digit2)
  result = case operator
           when '1'
             digit1 + digit2
           when '2'
             digit1 - digit2
           when '3'
             digit1 * digit2
           when '4'
             digit1 / digit2
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
prompt "#{messages('thanks_1', LANGUAGE)} \
#{name}#{messages('thanks_2', LANGUAGE)}"
