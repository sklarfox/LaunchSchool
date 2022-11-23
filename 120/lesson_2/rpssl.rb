class Player
  attr_reader :name, :move, :score

  def initialize
    @score = 0
  end

  def reset_score
    @score = 0
  end

  def increment_score
    @score += 1
  end

  private

  attr_writer :name, :move, :score
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
      puts "Please choose rock(r), paper(p), scissors(sc), "\
           "spock(sp), or lizard(l):"
      choice = gets.chomp
      break if Move::VALUES.include?(choice) || Move::ABRV.key?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

module Personalities
  class Hal < Player # Random
    def initialize
      @name = 'Hal'
      super
    end

    def choose
      self.move = Move.new(Move::VALUES.sample)
    end
  end

  class Rocky < Player # Always rock
    def initialize
      @name = 'Rocky Balboa'
      super
    end

    def choose
      self.move = Move.new(Move::VALUES[0])
    end
  end

  class Compy386 < Player # Mostly Spock, sometimes Lizard, rarely Paper
    def initialize
      @name = 'Compy 386'
      super
    end

    def choose
      choice = [1, 3, 3, 3, 3, 3, 4, 4, 4].sample
      self.move = Move.new(Move::VALUES[choice])
    end
  end

  class Romulan < Player # Always picks a losing move to spock
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
  attr_reader :value

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

module Displayable
  PROMPT_DELAY = 0

  def enter_to_continue
    puts "Enter to continue"
    gets
  end

  def display_welcome_message
    puts "Welcome, #{human.name}, to Rock, Paper, Scissors, Spock, Lizard!"
    enter_to_continue
  end

  def display_goodbye_message
    system 'clear'
    puts "Thank you for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!"
  end

  def display_round_winner
    puts "\n#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}.\n\n"
    if detect_round_winner
      puts "#{detect_round_winner.name} won the round!\n\n"
    else
      puts "It's a tie!\n\n"
    end
    sleep PROMPT_DELAY
    enter_to_continue
  end

  def display_scores
    system 'clear'
    scores_line = "| #{@human.name}: #{@human.score} |"\
                  " #{@computer.name}: #{@computer.score} |"
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
    puts "\nCongratulations!" if detect_overall_winner == human
    puts "\nBetter luck next time!" if detect_overall_winner == computer
  end

  def display_opponent
    puts "You will be playing against #{computer.name}"
    enter_to_continue
  end

  def display_personality_choices
    system 'clear'
    puts "Please choose an opponent:"
    counter = 1
    RPSGame::BOT_POOL.each do |bot|
      puts "#{counter}: #{bot.name}"
      counter += 1
    end
    puts "#{counter}: Random"
  end

  def display_logbook
    logbook.each.with_index do |match, idx|
      system 'clear'
      match.print(idx + 1)
      enter_to_continue
      system 'clear'
    end
  end
end

module Scoreable
  WINNING_SCORE = 5

  def reset_scores
    human.reset_score
    computer.reset_score
  end

  def detect_overall_winner
    return human if human.score == WINNING_SCORE
    return computer if computer.score == WINNING_SCORE
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

  def choose_personality
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if @valid_personality_choices.cover?(choice)
      puts "Sorry, the value must be from 1 to " \
           "#{@valid_personality_choices.last}"
    end
    self.computer = RPSGame::BOT_POOL.sample
    return if choice == @valid_personality_choices.last
    self.computer = RPSGame::BOT_POOL[choice - 1]
  end
end

class MatchLog
  attr_reader :log_arr, :winner

  include Displayable

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

  def print(match_number)
    rounds = log_arr.size
    (0...rounds).each do |round|
      system 'clear'
      puts "***** Match #{match_number} *****\nRound #{round + 1}:\n" \
           "#{@human_name} played #{log_arr[round].first}\n" \
           "#{@computer_name} played #{log_arr[round].last}\n"
      next if round == rounds - 1
      enter_to_continue
    end
    puts "\n***** The match winner was #{winner}! *****\n\n"
  end

  private

  attr_writer :log_arr, :winner
end

class RPSGame
  BOT_POOL = [Personalities::Hal.new,
              Personalities::Compy386.new,
              Personalities::Rocky.new,
              Personalities::Romulan.new]
  include Displayable
  include Chooseable
  include Scoreable

  attr_accessor :human, :computer, :logbook, :match_log

  def initialize
    system 'clear'
    @human = Human.new
    @logbook = []
    @valid_personality_choices = (1..RPSGame::BOT_POOL.size + 1)
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
    end
    match_log.log_winner(detect_overall_winner)
  end

  def initialize_new_match
    display_personality_choices
    choose_personality
    display_opponent
    @match_log = MatchLog.new(human, computer)
    reset_scores
  end

  def save_match_log
    logbook << match_log
  end

  def end_of_match
    system 'clear'
    display_scores
    display_overall_winner
    save_match_log
  end

  def play
    system 'clear'
    display_welcome_message
    loop do
      initialize_new_match
      play_until_winner
      end_of_match
      break unless play_again?
    end
    display_logbook if show_logbook?
    display_goodbye_message
  end
end

RPSGame.new.play
