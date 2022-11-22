=begin
  TODO wishlist
    add rules
    move  constants into class?
=end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
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
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Lappy386'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
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
    @human = Human.new
    @computer = Computer.new
  end

  def user_choice
    loop do
      answer = gets.chomp
      return answer if ['y', 'n'].include? answer.downcase
      puts "Sorry, response must be y or n."
    end
  end

  def display_welcome_message
    puts "Welcome #{human.name}, to Rock, Paper, Scissors!"
    sleep RPSGame::PROMPT_DELAY
  end

  def display_goodbye_message
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

  def play
    system 'clear'
    display_welcome_message
    loop do
      reset_scores
      play_until_winner
      display_scores
      display_overall_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

system 'clear'
RPSGame.new.play
