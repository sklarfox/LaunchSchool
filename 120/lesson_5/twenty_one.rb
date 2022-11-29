module Hand
  def hit

  end

  def stay

  end

  def busted?

  end

  def total

  end
end

class Player
  include Hand

  def initialize

  end
end

class Dealer
  include Hand

  def initialize

  end
end

class Deck
  def initialize

  end

  def deal

  end
end

class Card
  def initialize

  end
end

class Game
  def play
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end