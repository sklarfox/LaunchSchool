VALID_CHOICES = ["rock", "paper", "scissors"]

def test_method(string)
  prompt string
end

def display_result(player, computer)
  # Rotates the choices table to align with player choice at index 0
  winning_table = VALID_CHOICES.rotate(VALID_CHOICES.find_index(player))

  if winning_table.find_index(computer) == 0
    prompt "It's a tie!"
  elsif winning_table.find_index(computer) == 1
    prompt "Computer won!"
  else
    prompt "You won!"
  end
end

def prompt(message)
  puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That is not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_result(choice, computer_choice)

  prompt "Do you want to play again?"
  choice = gets.chomp

  break unless choice.downcase.start_with?('y')
end

prompt "Thank you for playing. Good bye!"
