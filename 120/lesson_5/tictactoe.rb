require 'pry'
require 'pry-byebug'

=begin
TODO
  - allow choice of first player
=end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                   [1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winning marker or return nil
  def winning_marker
    WINNING_LINES.each do |line|
      test_marker = @squares[line[0]].marker
      if @squares.values_at(*line).all? { |sq| sq.marker == test_marker }
        return test_marker unless test_marker == ' '
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker, :score, :name

  def initialize(marker)
    @name = 'balls'
    @marker = marker
    @score = 0
  end

  def increment_score
    @score += 1
  end

  def reset_score
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  POINTS_TO_WIN = 1
  attr_reader :board, :human, :computer

  def play
    clear
    display_welcome_message
    loop do
      main_game
      break unless play_again?
      reset_main_game
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = nil
  end

  def main_game
    set_first_player
    loop do
      display_board
      play_until_winner
      display_result
      increment_winner_score
      break if overall_winner?
      reset_match
    end
    display_result
    display_overall_winner
  end

  def reset_main_game
    human.reset_score
    computer.reset_score
    reset_match
    clear
  end

  def display_overall_winner
    case detect_overall_winner
    when HUMAN_MARKER then puts "You are the overall winner, congratulations!"
    when COMPUTER_MARKER then puts "The computer is the overall winner. Better luck next time!"
    end
  end

  def increment_winner_score
    if board.winning_marker == HUMAN_MARKER
      human.increment_score
    else
      computer.increment_score
    end
  end

  def play_until_winner
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      break if board.someone_won? || board.full?
      swap_current_player
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe!\n\n"
  end

  def display_goodbye_message
    puts "Thank you for playing Tic-Tac-Toe! Goodbye!"
  end

  def overall_winner?
    human.score == POINTS_TO_WIN || computer.score == POINTS_TO_WIN
  end

  def detect_overall_winner
    if human.score == POINTS_TO_WIN
      HUMAN_MARKER
    else
      COMPUTER_MARKER
    end
  end

  def human_moves
    print "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that is not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when HUMAN_MARKER
      puts "You won the round!"
    when COMPUTER_MARKER
      puts "The computer won the round!"
    else
      puts "It's a tie!"
    end
    sleep 1.25
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_scores
    puts "Human (#{human.marker}): #{human.score} | Computer (#{computer.marker}): #{computer.score}"
  end

  def display_board
    display_scores
    board.draw
    puts ""
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be a y or n"
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset_match
    board.reset
    clear
  end

  def display_play_again_message
    clear
    puts "Let's play again!\n\n"
  end

  def human_turn?
    @current_player == human
  end

  def swap_current_player
    @current_player = human_turn? ? computer : human
  end

  def current_player_moves
    if human_turn?
      human_moves
    else
      computer_moves
    end
  end

  def set_first_player
    puts "The human will go first."
    # TODO: Allow choice of first player
    @current_player = human
  end

  def joinor(items, delimiter=', ', word='or')
    case items.size
    when 0
      ''
    when 1
      items.first
    when 2
      items.join(" #{word} ")
    else
      final_item = items.pop.to_s
      "#{items.join(delimiter)}#{delimiter}#{word} #{final_item}"
    end
  end
end

game = TTTGame.new
game.play
