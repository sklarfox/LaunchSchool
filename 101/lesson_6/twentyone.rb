require 'pry'
require 'pry-byebug'

SUITS = ['H', 'D', 'C', 'S']
VALUES = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
POINTS = { 'A' => 11, '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7, '8' => 8,
           '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }
MAX_NUM = 21
DEALER_LIMIT = 17

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
  cards = player.map(&:join)
  prompt "Player: #{cards.join(', ')} [Total: #{total(player)}]"
end

def display_dealer_cards(dealer)
  cards = dealer.map(&:join)
  cards[0] = '??'
  prompt "Dealer: #{cards.join(', ')}"
end

def display_all_dealer_cards(dealer)
  cards = dealer.map(&:join)
  prompt "Dealer: #{cards.join(', ')} [Total: #{total(dealer)}]"
end

def total(cards)
  total = 0
  aces = 0
  cards.each do |card|
    value = POINTS[card[0]]
    total += value
  end

  loop do
    break if total <= MAX_NUM || aces == 0
    total -= 10
    aces -= 1
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
  total(hand) > MAX_NUM
end

def dealer_choice(cards)
  total(cards) < DEALER_LIMIT ? 'h' : 's'
end

def display_dealer_choice(choice)
  if choice == 'h'
    prompt "The dealer hits."
  else
    prompt "The dealer stays."
  end
end

def display_winner(dealer, player)
  if busted?(player)
    prompt "The player busted, dealer wins!"
  elsif busted?(dealer)
    prompt "The dealer busted, player wins!"
  elsif total(dealer) > total(player)
    prompt "The dealer wins!"
  elsif total(dealer) == total(player)
    prompt "Push! Nobody wins."
  else
    prompt "The player wins!"
  end
end

deck = initialize_deck
dealer_hand = []
player_hand = []

initial_deal(deck, dealer_hand, player_hand)

# Player turn
choice = ''
loop do
  display_hands(dealer_hand, player_hand)
  break if total(player_hand) == MAX_NUM
  choice = hit_or_stay
  deal(deck, player_hand) if choice == 'h'
  break if busted?(player_hand) || choice == 's'
end

# Dealer turn
unless busted?(player_hand)
  choice = ''
  loop do
    display_hands(dealer_hand, player_hand, true)
    sleep 1
    choice = dealer_choice(dealer_hand)
    display_dealer_choice(choice)
    sleep 2
    deal(deck, dealer_hand) if choice == 'h'
    break if busted?(dealer_hand) || choice == 's'
  end
end

# Compare hands
display_hands(dealer_hand, player_hand, true)
display_winner(dealer_hand, player_hand)
