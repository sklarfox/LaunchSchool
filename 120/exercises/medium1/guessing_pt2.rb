class GuessingGame
  attr_accessor :attempts_remaining, :guess, :answer, :range

  def initialize
    @guess = nil
    @range = setup_range
    @answer = @range.to_a.sample
    @attempts_remaining = calculate_attempts_allowed
  end

  def calculate_attempts_allowed
    Math.log2(size_of_range).to_i + 1
  end

  def size_of_range
    self.range.size
  end

  def setup_range
    bottom = user_chooses_bottom
    top = user_chooses_top(bottom)
    (bottom..top)
  end

  def user_chooses_bottom
    puts "Please input the low number for the range."
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if choice.integer?
      puts "Invalid choice."
    end
    @bottom = choice
  end

  def user_chooses_top(bottom)
    puts "Please input the high number for the range. It must be greater than #{bottom}."
    choice = nil
    loop do
      choice = gets.chomp.to_i
      break if choice > @bottom
      puts "Invalid choice."
    end
    choice
  end

  def display_guesses_remaining
    puts "You have #{attempts_remaining} guesses remaining."
  end

  def display_outcome
    if correct_guess?
      puts "You won the game! Woo woo! Brahp!!"
    else
      puts "You lost, womp womp. :("
    end
  end

  def player_turn
    puts "Please guess a number between #{self.range.first} and #{self.range.last}."
    loop do
      self.guess = gets.chomp.to_i
      break if valid_guess?
      puts "Sorry, that is an invalid choice."
    end
    decrement_attempts_remaining
  end

  def valid_guess?
    self.range.include?(guess)
  end

  def compare_guess_and_answer
    self.guess <=> self.answer
  end

  def correct_guess?
    self.guess == self.answer
  end

  def display_guess_evaluation
    case compare_guess_and_answer
    when -1 then puts "Your guess is too low."
    when 0 then puts "That is the number!"
    when 1 then puts "Your guess is too high."
    end
  end

  def decrement_attempts_remaining
    self.attempts_remaining -= 1
  end

  def play
    loop do
      display_guesses_remaining
      player_turn
      display_guess_evaluation
      break if correct_guess? || attempts_remaining == 0
    end
    display_outcome
  end
end

system 'clear'
game = GuessingGame.new
game.play
