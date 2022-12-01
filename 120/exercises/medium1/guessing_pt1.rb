class GuessingGame
  ATTEMPTS_PER_GAME = 7
  RANGE = (1..100)

  attr_accessor :attempts_remaining, :guess, :answer

  def initialize
    @attempts_remaining = ATTEMPTS_PER_GAME
    @guess = nil
    @answer = RANGE.to_a.sample
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
    puts "Please guess a number between #{RANGE.first} and #{RANGE.last}."
    loop do
      self.guess = gets.chomp.to_i
      break if valid_guess?
      puts "Sorry, that is an invalid choice."
    end
    decrement_attempts_remaining
  end

  def valid_guess?
    RANGE.include?(guess)
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
