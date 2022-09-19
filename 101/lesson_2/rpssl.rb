require 'yaml'
MESSAGES = YAML.load_file('rpssl_messages.yml')

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
    prompt MESSAGES['tie']
  elsif winning_table.find_index(computer) == 1 ||
        winning_table.find_index(computer) == 3
    prompt MESSAGES['computer_won']
  else
    prompt MESSAGES['player_won']
  end
end

def return_winner(player, computer, name)
  # Rotates the choices table to align with player choice at index 0
  winning_table = VALID_CHOICES.rotate(VALID_CHOICES.find_index(player))

  if winning_table.find_index(computer) == 0
    :tie
  elsif winning_table.find_index(computer) == 1 ||
        winning_table.find_index(computer) == 3
    :compy386
  else
    name
  end
end

def prompt(message)
  puts("=> #{message}")
end

def display_choices
  print MESSAGES['choose_one']
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
  prompt MESSAGES['scoreboard']
  print "  | "
  hash.each { |key, value| print "#{key.capitalize}: #{value} | " }
  puts ''
end

def display_rules
  system('clear')
  prompt MESSAGES['rules']
  gets.chomp
  system('clear')
end

def get_name
  name = ''
  prompt MESSAGES['ask_name']
  loop do
    name = gets.chomp.strip
    if name.empty?
      prompt MESSAGES['valid_name']
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
      prompt MESSAGES['invalid_choice']
    end
  end
  choice
end

def new_game?
  prompt MESSAGES['play_again']
  choice = gets.chomp
  if choice.downcase == 'y' || choice.downcase == 'yes'
    true
  else
    false
  end
end

system('clear')

# Welcome user, get name
prompt MESSAGES['welcome']
sleep 1
prompt MESSAGES['welcome_2']
sleep 1.5
name = get_name()
prompt format(MESSAGES['welcome_3'], name: name)
choice = gets.chomp.downcase
display_rules() if choice == 'y' || choice == 'yes'

# Main program loop
loop do
  # Single game loop until winner
  scoreboard = { name => 0, :compy386 => 0 }

  loop do
    # Determine choices for both players
    choice = collect_choice()
    computer_choice = VALID_CHOICES.sample

    # Determine/display winner and scores
    prompt format(MESSAGES['choices'], pc: choice, cc: computer_choice)
    display_result(choice, computer_choice)
    winner = return_winner(choice, computer_choice, name)
    scoreboard[winner] += 1 unless winner == :tie
    display_score(scoreboard)

    # Check for winner
    if scoreboard.value?(3)
      overall_winner = scoreboard.key(3).to_s.capitalize
      prompt format(MESSAGES['winner'], overall: overall_winner)
      break
    end
  end

  # Decide if new game will be played
  break unless new_game?()
  system('clear')
end

prompt format(MESSAGES['thanks'], name: name)
