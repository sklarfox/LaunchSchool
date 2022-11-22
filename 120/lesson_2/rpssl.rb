=begin
  TODO wishlist
    History as a class variable?

    todo before review
    Change points to win
        clear all TODOs
=end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = 0
  end

  def reset_score
    @score = 0
  end

  def increment_score
    @score += 1
  end
end

class Human < Player
  def initialize
    set_name
    super
  end
  
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
  end
end

class Computer < Player
 # Is this helpful to have in the heirarchy if no methods in it?
 # Should all personalities inherit directly from Player?
end

module Personalities
  class Hal < Computer # Random
    def initialize
      @name = 'Hal'
      super
    end
  
    def choose
      self.move = Move.new(Move::VALUES.sample)
    end
  end

  class Rocky < Computer # Always rock
    def initialize
      @name = 'Rocky Balboa'
      super
    end
    
    def choose
      self.move = Move.new(Move::VALUES[0])
    end
  end

  class Compy386 < Computer # Mostly Spock sometimes Lizard, rarely Paper
    def initialize
      @name = 'Compy 386'
      super
    end

    def choose
      choice = [1, 3, 3, 3, 3, 3, 4, 4, 4].sample
      self.move = Move.new(Move::VALUES[choice])
    end
  end

  class Romulan < Computer # Always picks a losing move to spock
    def initialize
      @name = 'The Romulan'
      super
    end

    def choose
      choice = [0, 2].sample
      self.move = Move.new(Move::VALUES[choice])
    end
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


class MatchLog
  attr_accessor :log_arr, :human_name, :computer_name, :winner
  def initialize(human, computer)
    @log_arr = Array.new
    @human_name = human.name
    @computer_name = computer.name
  end

  def log_moves(human, computer)
    log_arr << [human.move, computer.move]
  end

  def log_winner(winner)
    @winner = winner.name
  end

  def display_log
    puts log_arr
    puts @winner
  end

  def print
    rounds = log_arr.size
    (0...rounds).each do |round|
      puts "Round #{round + 1}:"
      puts "#{human_name} played #{log_arr[round].first}"
      puts "#{computer_name} played #{log_arr[round].last}"
      puts ""
      sleep Displayable::PROMPT_DELAY
    end
    puts "The winner was #{winner}!"
    puts "Enter to continue"
    gets
  end
end

module Displayable
  PROMPT_DELAY = 0.1

  def display_welcome_message
    puts "Welcome #{human.name}, to Rock, Paper, Scissors!"
    sleep RPSGame::PROMPT_DELAY * 2
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

  def display_overall_winner
    puts "#{detect_overall_winner.name} won the game!"
    puts "Congratulations!" if detect_overall_winner == human
    puts "Better luck next time!" if detect_overall_winner == computer
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

  def display_opponent
    puts "You will be playing against #{computer.name}"
    puts "Press enter to continue."
    gets
  end

  def display_opponent_choices
    system 'clear'
    puts "Please choose an opponent:"
    counter = 1
    RPSGame::BOT_POOL.each.with_index do |bot| 
      puts "#{counter}: #{bot.name}"
      counter += 1
    end
    puts "#{counter}: Random"
  end

  def display_logbook
    logbook.each.with_index do |match, idx| 
      puts "***** Match #{idx + 1} *****"
      match.print 
    end
  end
  
end

module Scoreable
  def reset_scores
    human.reset_score
    computer.reset_score
  end

  def detect_overall_winner
    return human if human.score == RPSGame::WINNING_SCORE
    return computer if computer.score == RPSGame::WINNING_SCORE
  end

  def increment_winner_score
    detect_round_winner.increment_score
  end

  def detect_round_winner
    if human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    end
  end


end

module Chooseable
  def user_choice?
    loop do
      answer = gets.chomp.downcase
      return true if answer == 'y'
      return false if answer == 'n'
      puts "Sorry, response must be y or n."
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    user_choice?
  end

  def show_logbook?
    puts "Would you like to see a history of all matches played? (y/n)"
    user_choice?
  end

  def set_opponent
    valid_choices = (1..RPSGame::BOT_POOL.size + 1)
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if valid_choices.cover?(choice)
      puts "Sorry, the value must be from 1 to #{valid_choices.last}"
    end
    if choice == valid_choices.last
      @computer = RPSGame::BOT_POOL.sample
    else
      @computer = RPSGame::BOT_POOL[choice - 1]
    end
  end
end

class RPSGame
  WINNING_SCORE = 1
  BOT_POOL = [Personalities::Hal.new,
              Personalities::Compy386.new,
              Personalities::Rocky.new,
              Personalities::Romulan.new
             ]
  include Displayable
  include Chooseable
  include Scoreable

  attr_accessor :human, :computer, :logbook, :match_log

  def initialize
    system 'clear'
    @human = Human.new
    @logbook = []
  end

  def play_until_winner
    loop do
      display_scores
      human.choose
      computer.choose
      match_log.log_moves(human, computer)
      increment_winner_score if detect_round_winner
      display_round_winner
      break if detect_overall_winner
      system 'clear'
    end
    match_log.log_winner(detect_overall_winner)
  end

  def initialize_new_match
    display_opponent_choices
    set_opponent
    display_opponent
    @match_log = MatchLog.new(human, computer)
    reset_scores
  end

  def save_match_log
    @logbook << match_log
  end

  def play
    system 'clear'
    display_welcome_message
    loop do
      initialize_new_match
      play_until_winner
      display_scores
      display_overall_winner
      save_match_log
      break unless play_again?
    end
    display_logbook if show_logbook?
    display_goodbye_message
   
  end
end

RPSGame.new.play