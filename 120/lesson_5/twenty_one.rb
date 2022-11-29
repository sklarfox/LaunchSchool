require 'pry'
require 'pry-byebug'

module Hand
  attr_reader :cards

  def busted?
    total > Game::MAX_NUM
  end

  def total
    total = cards.collect(&:points).sum
    # correct for Aces
    cards.select { |card| card.value == 'A' }.count.times do
      total -= 10 if total > Game::MAX_NUM
    end
    total
  end

  def <<(card)
    cards << card
  end

  def print_all_cards
    output = ''
    cards.each do |card|
      output << "#{card} "
    end
    puts output
  end

  def reset
    @cards = []
  end
end

class Player
  include Hand

  def initialize
    @cards = []
  end

  def display_cards
    print "Player (Total: #{total}) "
    print_all_cards
  end
end

class Dealer
  include Hand

  def initialize
    @cards = []
  end

  def display_cards
    print "Dealer (Total: ??) [??] "
    cards[1..-1].each do |card|
      print "#{card} "
    end
    puts ''
  end

  def display_all_cards
    print "Dealer (Total: #{total}) "
    print_all_cards
  end
end

class Deck
  SUITS = %w(♡ ♢ ♧ ♤)
  VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  POINTS = { 'A' => 11, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
             '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
             'J' => 10, 'Q' => 10, 'K' => 10 }

  def initialize
    @cards = []
    VALUES.each do |value|
      SUITS.each do |suit|
        @cards << Card.new(value, suit, POINTS[value])
      end
    end
    @cards = @cards.shuffle
  end

  def deal
    @cards.pop
  end
end

class Card
  attr_reader :value, :suit, :points

  def initialize(value, suit, points)
    @value = value
    @suit = suit
    @points = points
  end

  def to_s
    "[#{value}#{suit}]"
  end
end

class Game
  attr_reader :player, :dealer, :deck

  MAX_NUM = 21
  DEALER_MAX = 17
  PROMPT_DELAY = 1.5

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def play
    display_welcome_message
    game_loop
    display_goodbye_message
  end

  def game_loop
    loop do
      deal_cards
      display_table
      player_turn
      dealer_turn unless player.busted?
      display_full_table
      show_result
      break unless play_again?
      reset
    end
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!"
  end

  def reset
    @deck = Deck.new
    player.reset
    dealer.reset
  end

  def display_goodbye_message
    puts "Thank you for playing Twenty-One! Goodbye!"
  end

  def show_result
    player_total = player.total
    dealer_total = dealer.total
    puts "The player busted, dealer wins!" if player.busted?
    puts "The dealer busted, player wins!" if dealer.busted?
    puts "Push!" if player_total == dealer_total
    puts "The dealer wins!" if dealer_total > player_total
    puts "The player wins!" if player_total > dealer_total
  end

  def dealer_turn
    display_full_table
    display_dealer_turn_message
    loop do
      break if dealer.busted? || dealer.total >= DEALER_MAX || player.busted?
      display_dealer_hits_message
      dealer << deck.deal
      display_full_table
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if answer == 'y' || answer == 'n'
      puts "Sorry, that's an invalid choice."
    end
    return true if answer == 'y'
    return false if answer == 'n'
  end

  def display_dealer_hits_message
    puts "The dealer hits!"
    sleep PROMPT_DELAY
  end

  def display_dealer_turn_message
    puts "It is now the dealer's turn."
    sleep PROMPT_DELAY
  end

  def display_full_table
    system 'clear'
    dealer.display_all_cards
    player.display_cards
  end

  def player_turn
    loop do
      action = player_chooses_action
      player << deck.deal if action == 'hit'
      display_table
      break if player.busted? || action == 'stay' || player.total == MAX_NUM
    end
  end

  def player_chooses_action
    puts "Would you like to (h)it or (s)tay?"
    loop do
      choice = gets.chomp.downcase
      return 'hit' if choice == 'h' || choice == 'hit'
      return 'stay' if choice == 's' || choice == 'stay'
      puts "Sorry, that is an invalid choice."
    end
  end

  def deal_cards
    2.times do
      player << deck.deal
      dealer << deck.deal
    end
  end

  def display_table
    system 'clear'
    dealer.display_cards
    player.display_cards
  end
end

Game.new.play
