VALID_CHOICES = ["rock", "paper", "scissors", "spock", "lizard"]
VALID_ABRV = { 'r' => 'rock',
               'p' => 'paper',
               'sc' => 'scissors',
               'sp' => 'spock',
               'l' => 'lizard' }

def display_result(player, computer)
  # Rotates the choices table to align with player choice at index 0
  winning_table = VALID_CHOICES.rotate(VALID_CHOICES.find_index(player))

  if winning_table.find_index(computer) == 0
    prompt "It's a tie!"
  elsif winning_table.find_index(computer) == 1 ||
        winning_table.find_index(computer) == 3
    prompt "Computer won the round!"
  else
    prompt "You won the round!"
  end
end

def return_winner(player, computer)
  # Rotates the choices table to align with player choice at index 0
  winning_table = VALID_CHOICES.rotate(VALID_CHOICES.find_index(player))

  if winning_table.find_index(computer) == 0
    :tie
  elsif winning_table.find_index(computer) == 1 ||
        winning_table.find_index(computer) == 3
    :compy386
  else
    :player
  end
end

def prompt(message)
  puts("=> #{message}")
end

def display_choices
  print "=> Choose one: "
  VALID_ABRV.each { |key, value| print "#{value}(#{key}) " }
  puts "\n"
end

def valid_choice?(input)
  (VALID_CHOICES.include?(input) || VALID_ABRV.include?(input))
end

def standardize_choice(input)
  if VALID_ABRV.include?(input)
    VALID_ABRV[input]
  else
    input
  end
end

def display_score(hash)
  prompt "Scoreboard:"
  print "  | "
  hash.each { |key, value| print "#{key.capitalize}: #{value} | " }
  puts ''
end

def display_rules
  system('clear')
  rules = <<-MSG
 Scissors cuts Paper
    Paper covers Rock\n    Rock crushes Lizard
    Lizard poisons Spock\n    Spock smashes Scissors
    Scissors decapitates Lizard
    Lizard eats Paper
    Paper disproves Spock
    Spock vaporizes Rock
    Rock (as it always has) crushes Scissors

    Enter any key to continue
    MSG
  prompt rules
  gets.chomp
end

def get_name
  name = ''
  prompt "What is your name?"
  loop do
    name = gets.chomp.strip
    if name.empty?
      prompt("Make sure to use a valid name.")
    else
      break
    end
  end
  name
end

def collect_choice
  choice = ''
  loop do # Collect user input loop
    display_choices()
    choice = gets.chomp.downcase

    if valid_choice?(choice)
      choice = standardize_choice(choice)
      system('clear')
      break
    else
      prompt "That is not a valid choice."
    end
  end
  choice
end

system('clear')

# Welcome user, get name
prompt "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
sleep 1
prompt "You will be playing against a state of the art computer, Compy386!"
sleep 1.5
name = get_name()

# Main program loop
loop do
  # Single game loop until winner
  scoreboard = { name => 0, 'compy386' => 0 }

  loop do
    # Determine player choices
    choice = collect_choice()
    computer_choice = VALID_CHOICES.sample

    # Determine/display winner and scores
    prompt "You chose: #{choice}; Compy386 chose: #{computer_choice}"
    display_result(choice, computer_choice)
    winner = return_winner(choice, computer_choice)
    winner = name if winner == :player
    scoreboard[winner] += 1 unless winner == :tie
    display_score(scoreboard)

    # Check for winner
    if scoreboard.value?(3)
      overall_winner = scoreboard.key(3)
      prompt "The winner of the game is #{overall_winner.to_s.capitalize}!"
      break
    end
  end

  # Decide if new game will be played
  prompt "Would you like to play again? (y/n)"
  choice = gets.chomp
  break unless choice.downcase == 'y' || choice.downcase == 'yes'
  system('clear')
end

prompt "Thank you for playing, #{name}. Goodbye!"
