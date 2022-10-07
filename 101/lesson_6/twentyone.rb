=begin
1. Initialize deck DONE
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

# Problem ----------------------


# Examples ---------------------

# Data Structures --------------
Deck:
Array [Ace, Ace, Ace, Ace, '1', '1', '1', '1', '2', '2', '2,' '2', ...]

# Algorithm --------------------

# Code -------------------------

=end

require 'pry'
require 'pry-byebug'

SUITS = ['H', 'D', 'C', 'S']
VALUES = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  VALUES.product(SUITS).shuffle
end

def initial_deal(deck, dealer, player)
  binding.pry
  2.times do
    deal(deck, dealer)
    deal(deck, player)
  end
end

def deal(deck, hand)
  hand << deck.shift
 end

def display_hands(dealer, player)
  prompt "Player: #{hand.inspect}"
end

# Initialize deck and hands
deck = initialize_deck
dealer_hand = []
player_hand = []

initial_deal(deck, dealer_hand, player_hand)

# Player turn