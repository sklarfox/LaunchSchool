=begin
  TODO wishlist
    show rules?
    implement personalities
    implement choice of opponent
    move things into module
    clear all TODOs
    method access control
=end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @score = 0
    @history = []
  end

  def reset_score
    @score = 0
  end

  def increment_score
    @score += 1
  end

  def log_move(move)
    history << move.to_s
  end
end

class Human < Player
  def set_name
    puts "Hi there! What is your name?"
    n = ''
    loop do
      n = gets.chomp.strip
      break unless n.empty?
      puts "Sorry, you must enter a valid name."
      puts "What is your name?"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock(r), paper(p), scissors(sc), spock(sp), or lizard(l):"
      choice = gets.chomp
      break if Move::VALUES.include?(choice) || Move::ABRV.key?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    log_move(move)
  end
end

class Computer < Player

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Lappy386'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    log_move(move)
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  ABRV = { 'r' => 'rock',
           'p' => 'paper',
           'sc' => 'scissors',
           'sp' => 'spock',
           'l' => 'lizard' }

  DEFEATS = { 'rock' => ['lizard', 'scissors'],
              'paper' => ['rock', 'spock'],
              'scissors' => ['lizard', 'paper'],
              'spock' => ['rock', 'scissors'],
              'lizard' => ['spock', 'paper'] }

  attr_reader :value

  def initialize(value)
    @value = if Move::VALUES.include?(value)
               value
             else
               Move::ABRV[value]
             end
  end

  def >(other_move)
    Move::DEFEATS[value].include?(other_move.value)
  end

  def <(other_move)
    Move::DEFEATS[other_move.value].include?(value)
  end

  def to_s
    @value
  end
end

class RPSGame
  PROMPT_DELAY = 0.5
  WINNING_SCORE = 1
  attr_accessor :human, :computer

  def initialize
    system 'clear'
    @human = Human.new
    # @computer = Computer.new
  end

  def user_choice
    loop do
      answer = gets.chomp.downcase
      return answer if ['y', 'n'].include? answer
      puts "Sorry, response must be y or n."
    end
  end

  def display_welcome_message
    puts "Welcome #{human.name}, to Rock, Paper, Scissors!"
    sleep RPSGame::PROMPT_DELAY
  end

  def display_goodbye_message
    system 'clear'
    puts "Thank you for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!"
  end

  def display_round_winner
    puts "#{human.name} chose #{human.move}."
    sleep RPSGame::PROMPT_DELAY
    puts "#{computer.name} chose #{computer.move}."
    sleep RPSGame::PROMPT_DELAY
    if detect_round_winner
      puts "#{detect_round_winner.name} won the round!"
    else
      puts "It's a tie!"
    end
    sleep RPSGame::PROMPT_DELAY * 2
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = user_choice

    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def reset_scores
    human.reset_score
    computer.reset_score
  end

  def detect_round_winner
    if human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    end
  end

  def increment_winner_score
    detect_round_winner.increment_score
  end

  def display_scores
    system 'clear'
    scores_line = "| #{human.name}: #{human.score} | #{computer.name}: #{computer.score} |"
    width = scores_line.length - 2
    horizontal = "+#{'-' * width}+"
    puts horizontal
    puts "|#{'Scoreboard'.center(width)}|"
    puts horizontal
    puts scores_line
    puts horizontal
  end

  def detect_overall_winner
    return human if human.score == RPSGame::WINNING_SCORE
    return computer if computer.score == RPSGame::WINNING_SCORE
  end

  def display_overall_winner
    puts "#{detect_overall_winner.name} won the game!"
    puts "Congratulations!" if detect_overall_winner == human
    puts "Better luck next time!" if detect_overall_winner == computer
  end

  def play_until_winner
    loop do
      display_scores
      human.choose
      computer.choose
      increment_winner_score if detect_round_winner
      display_round_winner
      break if detect_overall_winner
      system 'clear'
    end
  end

  def display_history
    number_of_rounds = human.history.size
    number_of_rounds.times do |n|
      puts "Round #{n + 1}:"
      puts "#{human.name} chose #{human.history[n]}"
      puts "#{computer.name} chose #{computer.history[n]}"
      sleep PROMPT_DELAY * 3
    end
  end

  def show_history?
    puts "Would you like to see a history of both player choices? (y/n)"
    true if user_choice == 'y'
  end

  def choose_opponent
    # TODO Validate User Input
    puts "Please choose an opponent:"
    
    choice = gets.chomp

  end

  def display_opponent
    puts "You will be playing against #{computer.name}"
  end

  def play
    system 'clear'
    display_welcome_message
    loop do
      choose_opponent
      display_opponent
      reset_scores
      play_until_winner
      display_scores
      display_overall_winner
      break unless play_again?
    end
    display_history if show_history?
    display_goodbye_message
  end
end

RPSGame.new.play


=begin
  personalities as new classes
    have to redo history
    how to generate new Computer object based off user input? (initialize all bots into a hash and select from there?)
    do this!
      case statement 

  personalities as a state in Computer
    history won't have mention of the name
    easier to modify personality based off user input


    move things from RPS game class into modules
=end