=begin
1. Initialize deck DONE
2. Deal cards to player and dealer DONE
3. Player turn: hit or stay DONE
  - repeat until bust or "stay" DONE
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
  2.times do
    deal(deck, dealer)
    deal(deck, player)
  end
end

def deal(deck, hand)
  hand << deck.shift
end

def display_hands(dealer, player, reveal=false)
  system 'clear'
  reveal ? display_all_dealer_cards(dealer) : display_dealer_cards(dealer)
  display_player_cards(player)
end

def display_player_cards(player)
  cards = player.map do |card|
    card.join
  end
  prompt "Player: #{cards.join(', ')} [Total: #{total(cards)}]"
end

def display_dealer_cards(dealer)
  cards = dealer.map do |card|
    card.join
  end
  cards[0] = '??'
  prompt "Dealer: #{cards.join(', ')}"
end

def display_all_dealer_cards(dealer)
  cards = dealer.map do |card|
    card.join
  end
  prompt "Dealer: #{cards.join(', ')} [Total: #{total(cards)}]"
end

def total(cards) # TODO Impliment Ace 1/11 switch somehow. Get total to account for face values
  total = 0
  value = 0
  # binding.pry
  cards.each do |card|
    case card[0]
    when 'A' then value = 11
    when '2'..'9' then value = card[0].to_i
    else
      value = 10
    end
    total += value
  end
  total
end

def hit_or_stay
  choice = nil
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    choice = gets.chomp.downcase
    break if choice == 's' || choice == 'h'
    prompt "Sorry, that is an invalid choice."
  end
  if choice == 'h'
    prompt "You chose to hit."
  else
    prompt "You chose to stay."
  end
  sleep 1
  choice
end

def busted?(hand)
  total(hand) > 21
end

def dealer_choice(cards)
  total(cards) < 17 ? 'h' : 's'
end

def display_dealer_choice(choice)
  if choice == 'h'
    prompt "The dealer hits."
  else
    prompt "The dealer stays."
  end
end

deck = initialize_deck()
dealer_hand = []
player_hand = []

initial_deal(deck, dealer_hand, player_hand)

# Player turn
choice = ''
loop do
  display_hands(dealer_hand, player_hand)
  break if total(player_hand) == 21
  choice = hit_or_stay()
  deal(deck, player_hand) if choice == 'h'
  break if busted?(player_hand) || choice == 's'
end

# Dealer turn
unless busted?(player_hand)
  choice = ''
  loop do
    display_hands(dealer_hand, player_hand, true)
    choice = dealer_choice(dealer_hand)
    display_dealer_choice(choice)
    sleep 0.5
    deal(deck, dealer_hand)
    sleep 0.5
    break if busted?(dealer_hand) || choice == 's'
  end
end

# Compare hands
