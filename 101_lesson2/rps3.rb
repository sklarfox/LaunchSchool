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
    return :tie
  elsif winning_table.find_index(computer) == 1 ||
        winning_table.find_index(computer) == 3
    return :compy386
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
  hash.each { |key, value| print "#{key.capitalize}: #{value} | " }
  puts "\n\n"
end

def welcome_user
  prompt "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
  prompt "What is your name?"
  name = gets.chomp
  prompt "Welcome #{name}! Would you like to hear the rules? (y/n)"
  choice = gets.chomp
  if choice.downcase.start_with?('y')
    display_rules()
  end
  name
end

def display_rules
  # TODO
end

system('clear')
name = welcome_user()
name_sym = name.downcase.to_sym

# Program loop
loop do
  # Single game loop, until winner
  scoreboard = {name_sym => 0, compy386: 0}

  loop do

    choice = ''

    loop do   # Collect user input loop
      # TODO display_choices() to include abrv
      prompt "Choose one: #{VALID_CHOICES.join(', ')}"
      choice = gets.chomp.downcase

      if valid_choice?(choice)
        choice = standardize_choice(choice)  # TODO Cleanup? This is probably ugly code, omit new lines?
        system('clear')
        break
      else
        prompt "That is not a valid choice."
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt "You chose: #{choice}; Compy386 chose: #{computer_choice}\n\n"

    display_result(choice, computer_choice)
    winner = return_winner(choice, computer_choice)
    winner = name_sym if winner == :player
    scoreboard[winner] += 1 unless winner == :tie
    display_score(scoreboard)

    if scoreboard.has_value?(3)
      overall = scoreboard.key(3)
      prompt "The winner of the game is #{overall.to_s.capitalize}!\n\n"
      break
    end
  end

  # Decide if new game will be played
  prompt "Would you like to play again? (y/n)"
  choice = gets.chomp
  break unless choice.downcase.start_with?('y')
  system('clear')
end
prompt "Thank you for playing #{name}. Good bye!"
