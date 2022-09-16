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
  puts "\n\n"
end

def welcome_user
  prompt "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
  prompt "You will be playing against a state of the art computer, Compy386"
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

system('clear')
name = welcome_user()
name_sym = name.downcase.to_sym

# Program loop
loop do
  # Single game loop, until winner
  scoreboard = { name_sym => 0, :compy386 => 0 }

  loop do
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

    computer_choice = VALID_CHOICES.sample

    prompt "You chose: #{choice}; Compy386 chose: #{computer_choice}\n\n"

    display_result(choice, computer_choice)
    winner = return_winner(choice, computer_choice)
    winner = name_sym if winner == :player
    scoreboard[winner] += 1 unless winner == :tie
    display_score(scoreboard)

    if scoreboard.value?(3)
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
