=begin
TODO
Consider using HEREDOC for user messages that span multiple lines - just to tidy things up a little.
Magic numbers
Your main game loop was quite long. Can you think of any helper methods you could create to extract out some of this functionality. Hint - your comments break the code up nicely.
Restrict valid user input to y/n
Refactor main game loop, extract logic to helper methods
=end

PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
INITIAL_MARKER = ' '

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def display_board(brd)
  system 'clear'
  board = <<-HEREDOC
  You're an #{PLAYER_MARKER}, Computer is an #{COMPUTER_MARKER}"
  
  1    |2    |3
    #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
       |     |
  -----+-----+-----
  4    |5    |6
    #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
       |     |
  -----+-----+-----
  7    |8    |9
    #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
       |     |
  
  HEREDOC
  puts board
end

board = initialize_board
display_board(board)