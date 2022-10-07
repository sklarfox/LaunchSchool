=begin
TODO
Consider using HEREDOC for user messages that span multiple lines - just to tidy things up a little.
Your main game loop was quite long. Can you think of any helper methods you could create to extract out some of this functionality. Hint - your comments break the code up nicely.
Restrict valid user input to y/n
=end

def prompt(msg)
  puts "=> #{msg}"
end

def choose_user_marker
  loop do
    prompt "What would you like your marker to be? (X or O)"
    choice = gets.chomp.strip.upcase
    return choice if choice == 'X' || choice == 'O'
    prompt "Sorry, that is an invalid choice."
  end
end

def choose_first_player
  choice = nil
  while !choice
    puts "Who will go first? player (p), computer (c), random(r)"
    input = gets.chomp.downcase
    case input
    when 'p', 'player' then choice = 'Player'
    when 'c', 'computer' then choice = 'Computer'
    when 'r', 'random' then choice = ['Player', 'Computer'].sample
    else
      puts "That is an invalid choice."
    end
  end
  puts "The #{choice.downcase} will go first."
  sleep 2
  choice
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}, Computer is an #{COMPUTER_MARKER}"
  puts ""
  puts "1    |2    |3"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "4    |5    |6"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "7    |8    |9"
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

def initialize_scoreboard
  { 'Player' => 5, 'Computer' => 0, nil => 0 } # FLAG TODO
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
  # Offense first
  square = detect_at_risk_square(brd, COMPUTER_MARKER)

  # Then Defense
  if !square
    square = detect_at_risk_square(brd, PLAYER_MARKER)
  end

  # Choose middle if available
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  # Otherwise pick randomly
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
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

def display_scoreboard(scrbrd)
  puts "| Scoreboard |".center(27)
  puts "| Player: #{scrbrd['Player']} | Computer: #{scrbrd['Computer']} |"
end

def enter_to_continue
  prompt 'Enter to continue'
  gets
end

def play_again?
  prompt "Play again? (y or n)"
  user_input_yes?
end

def overall_winner?(scrbrd)
  scrbrd['Player'] == WINNING_POINTS || scrbrd['Computer'] == WINNING_POINTS
end

def detect_overall_winner(scrbrd)
  if scrbrd['Player'] == WINNING_POINTS
    'Player'
  else
    'Computer'
  end
end

def detect_at_risk_square(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line[brd.values_at(*line).index(INITIAL_MARKER)]
    end
  end
  nil
end

def place_piece!(brd, current)
  current == 'Player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(current)
  current == 'Player' ? 'Computer' : 'Player'
end

def welcome_user
  prompt "Welcome to Tic-Tac-Toe!"
  sleep 1.5
  prompt "Would you like to hear the rules? (y or n)"
  display_rules if user_input_yes?
end

def display_rules
  prompt "Players alternate placing markers on the board."
  sleep 3
  prompt "The first player to have 3 markers in a row (diagonals included)" \
         ", wins the round."
  sleep 5
  prompt "If the board is full, and neither player has 3 in a row, " \
         "the result is a tie."
  sleep 5
  prompt "Players alternate who places first between rounds."
  sleep 4
  prompt "Play continues until one player reaches 5 points."
  sleep 3.5
  enter_to_continue
end

def display_overall_winner(scrbrd)
  if detect_overall_winner(scrbrd) == 'Player'
    prompt "Congratulations, you won the game!"
  else
    prompt "The computer won the game."
  end
  sleep 2
end

def players_place_pieces(board, current_player)
  loop do
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end
end

def user_input_yes?
  choice = false
  loop do
    input = gets.chomp.downcase
    if input == 'y' || input == 'yes'
      choice = true
      break
    elsif input == 'n' || input == 'no'
      break
    else
      prompt "Sorry, that's an invalid choice."
    end
  end
  choice
end

# Welcome the user, get player choices
system 'clear'
welcome_user

# Define constants
INITIAL_MARKER = ' '
PLAYER_MARKER = choose_user_marker
COMPUTER_MARKER = PLAYER_MARKER == 'X' ? 'O' : 'X'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
WINNING_POINTS = 5

# Main game
loop do
  scoreboard = initialize_scoreboard
  first = choose_first_player
  # Each Round
  loop do
    # Start the round
    board = initialize_board
    display_board(board)

    players_place_pieces(board, first)

    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} won the round!"
      scoreboard[winner] += 1
    else
      prompt "It's a tie!"
    end

    display_scoreboard(scoreboard)
    
    first = alternate_player(first)
    
    if overall_winner?(scoreboard)
      display_overall_winner(scoreboard)
      break
    end

    enter_to_continue
  end
  break unless play_again?
end

prompt "Thanks for playing Tic-tac-toe!"
