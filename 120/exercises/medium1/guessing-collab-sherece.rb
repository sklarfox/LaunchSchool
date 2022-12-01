=begin
create an OOP number guessing class for numbers from 1..100 with a limit
of 7 guesses per game.

Description:
 The game picks a number between 1 and 100. The player tries to guess that number,the game evaluates/displays if the guess is high or low or correct. The player gets 7 chances to guess the correct number.
 

nouns
  game
    -evaluates/display guess
    -picks number
    - guess
    - chances


verbs
  guess
  evaluates/displays


Number class
  number set to random between 1..100

Guesses class
  guesses set to 7

GuessingGame class
  -play method
    game loop:
      display number of guesses remaining
      ask user for a number between 1 and 100
        validate number - error messeage if outside range
      display whether guess is low, high, or correct
      break loop if guess = number or 0 guesses remaining
      subtract one from number of guesses
    display whether player won or lost

=end

class GuessingGame
  attr_reader :number
  attr_accessor :guesses, :choice

  def initialize
    @choice = nil
    @guesses = 7
    @number = 50 #(1..100).to_a.sample
  end

  def player_chooses
    puts "Enter a number between 1 and 100:"
    loop do
      self.choice = gets.chomp.to_i
      break if valid_choice?
      puts "Invalid choice. Enter a number between 1 and 100:"
    end
    self.guesses -= 1
  end

  def valid_choice?
    (1..100).include?(choice)
  end

  def display_guesses_remaining
    puts "You have #{guesses} guesses remaining."
  end

  def display_guess 
    case choice <=> number
    when -1 then puts "Your guess is too low."
    when 0 then puts "That's the number!"
    when 1 then puts "Your guess is too high."
    end
  end

  def guess_correct?
    number == choice
  end

  def display_outcome
    if guess_correct?
      puts "You won!"
    else
      puts "You have no more guesses, you lost. Womp womp."
    end
  end

  def play
    loop do
      display_guesses_remaining
      player_chooses
      display_guess
      break if guess_correct? || guesses == 0
    end
    display_outcome
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!