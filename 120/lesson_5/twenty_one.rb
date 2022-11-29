module Hand
  attr_accessor :cards

  def hit

  end

  def stay

  end

  def busted?

  end

  def total

  end

  def <<(card)
    cards << card
  end

  def display_all_cards
    print "Player: "
    cards.each do |card|
      print "#{card} "
    end
    puts ''
  end
end

class Player
  include Hand

  def initialize
    @cards = []
  end
end

class Dealer
  DEALER_MAX = 17
  include Hand

  def initialize
    @cards = []
  end

  def display_dealer_cards
    print "Dealer: [??] "
    cards[1..-1].each do |card|
      print "#{card} "
    end
    puts ''
  end
end

class Deck
  SUITS = %w(♡ ♢ ♧ ♤)
  VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  POINTS = { 'A' => 11, '2' => 2, '3' => 3, '4' => 4, '5' => 5, 
             '6' => 6,'7' => 7, '8' => 8, '9' => 9, '10' => 10, 
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

  def draw
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
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def play
    deal_cards
    dealer.display_dealer_cards
    player.display_all_cards

    # show_initial_cards
    # player_turn
    # dealer_turn
    # show_result
  end

  def deal_cards
    2.times do
      player << deck.draw
      dealer << deck.draw
    end
  end
end

Game.new.play