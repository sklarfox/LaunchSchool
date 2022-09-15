VALID_CHOICES = ["rock", "paper", "scissors", "spock", "lizard"]
VALID_ABRV = { 'r' => 'rock',
              'p' => 'paper',
              'sc' => 'scissors',
              'sp' => 'spock',
              'l' => 'lizard' }

def test_method(string)
  prompt string
end

def display_result(player, computer)
  # Rotates the choices table to align with player choice at index 0
  winning_table = VALID_CHOICES.rotate(VALID_CHOICES.find_index(player))

  if winning_table.find_index(computer) == 0
    prompt "It's a tie!\n\n"
  elsif winning_table.find_index(computer) == 1 ||
        winning_table.find_index(computer) == 3
    prompt "Computer won the round!\n\n"
  else
    prompt "You won the round!\n\n"
  end
end

def return_winner(player, computer)
  # Rotates the choices table to align with player choice at index 0
  winning_table = VALID_CHOICES.rotate(VALID_CHOICES.find_index(player))

  if winning_table.find_index(computer) == 0
    return :ties
  elsif winning_table.find_index(computer) == 1 ||
        winning_table.find_index(computer) == 3
    return :computer
  else
    return :player
  end
end

def prompt(message)
  puts("=> #{message}")
end

def display_choices
# TODO
end

def valid_choice?(input)
  (VALID_CHOICES.include?(input) || VALID_ABRV.include?(input))
end

def standardize_choice(input)
  if VALID_ABRV.include?(input)
    return VALID_ABRV[input]
  else
    return input
  end
end

def display_score(hash) # This is probably ugly formatting. TODO use the formatted blocky thing
  prompt "Scoreboard:"
  print "  | "
  hash.each { |key, value| print "#{key}: #{value} | " }
  puts "\n\n"
end

# Main game, until winner
system('clear')
scoreboard = {player: 0, computer: 0, ties: 0}

loop do

  choice = ''

  loop do   # Collect user input loop
    # TODO display_choices() to include abrv
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp.downcase

    if valid_choice?(choice)
      choice = standardize_choice(choice)  # TODO Cleanup? This is probably ugly code
      system('clear')
      break
    else
      prompt "That is not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}\n\n"

  display_result(choice, computer_choice)
  winner = return_winner(choice, computer_choice)
  scoreboard[winner] += 1
  display_score(scoreboard)

  if scoreboard.has_value?(3)
    overall = scoreboard.key(3)
    prompt "The winner of the game is the #{overall.to_s}!"
    break
  end
end

prompt "Thank you for playing. Good bye!"
