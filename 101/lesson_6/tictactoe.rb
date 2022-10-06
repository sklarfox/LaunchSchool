require 'pry'

=begin
  TODO items:
  Display scoreboard
  Indicate which squares are which number
=end

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}, Computer is an #{COMPUTER_MARKER}"
  puts ""
  puts "     |     | "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     | "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     | "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
    sleep 1
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  if detect_at_risk_square(brd)
    brd[detect_at_risk_square(brd)] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_MARKER &&
    #    brd[line[1]] == PLAYER_MARKER &&
    #    brd[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
    # end

    if brd.values_at(*line).count('X') == 3
      return 'Player'
    elsif brd.values_at(*line).count('O') == 3
      return 'Computer'
    end
  end
  nil
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

def initialize_scoreboard
  { 'Player' => 0, 'Computer' => 0, nil => 0 }
end

def display_scoreboard(scoreboard)
  puts "Scoreboard".center(21)
  puts "Player: #{scoreboard['Player']}, Computer: #{scoreboard['Computer']}"
  prompt 'Enter to continue'
  gets
end

def play_again?
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase == 'y' || answer.downcase == 'yes'
end

def overall_winner?(scrbrd)
  scrbrd['Player'] == 5 || scrbrd['Computer'] == 5
end

def detect_overall_winner(scrbrd)
  if scrbrd['Player'] == 5
    'Player'
  else
    'Computer'
  end
end

def detect_at_risk_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line[brd.values_at(*line).index(INITIAL_MARKER)]
    end
  end
  nil
end

# Game Loop
loop do
  scoreboard = initialize_scoreboard

  # Round Loop
  loop do
    board = initialize_board
    display_board(board)

    # Players place pieces loop
    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    # Add score if someone won
    if someone_won?(board)
      prompt "#{detect_winner(board)} won the round!"
      scoreboard[detect_winner(board)] += 1
    else
      prompt "It's a tie!"
    end

    # Check for overall winner
    if overall_winner?(scoreboard)
      prompt "#{detect_overall_winner(scoreboard)} won the game!"
      sleep 3
      break
    end
    display_scoreboard(scoreboard)
  end
  break unless play_again?
end

prompt "Thanks for playing Tic-tac-toe!"
