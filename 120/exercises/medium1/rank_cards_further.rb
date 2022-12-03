require 'pry'
require 'pry-byebug'

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  SUIT_VALUES = { 'Spades' => 4, 'Hearts' => 3, 'Clubs' => 2, 'Diamonds' => 1 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def suit_value
    SUIT_VALUES.fetch(@suit)
  end

  def <=>(other_card)
    # value <=> other_card.value
    # binding.pry
    if value == other_card.value
      suit_value <=> other_card.suit_value
    else
      value <=> other_card.value
    end
  end
end

cards = [Card.new(3, 'Hearts'),
         Card.new(3, 'Spades'),
         Card.new('Queen', 'Diamonds'),
         Card.new('Queen', 'Clubs')]

puts cards.min
puts cards.max