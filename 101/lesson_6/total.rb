=begin

# Problem ----------------------
Write a method that totals up the values of a hand of cards. 2-10 are face value, face cards are 10, and and A is 1 or 11, depending on if the total value is over 11
# Examples ---------------------
total(['A', '5', 'J']) == 16
total(['A', 'K']) == 21
total(['5', '6', '2']) == 13

# Data Structures --------------

# Algorithm --------------------
1. Tally up the total value of all the cards , while recording how many aces are in the handDONE
  3. Set a counter to the number of aces
  4. Loop
      subtract 10 from the total
      subtract 1 from the ace counter
      break if total <= 21 OR out ace counter == 0

# Code -------------------------
=end

MAX_NUM = 21

def total(cards)
  total = 0
  value = 0
  aces = 0
  cards.each do |card|
    case card[0]
    when 'A'
      value = 11
      aces += 1
    when '2'..'9'
      value = card[0].to_i
    else
      value = 10
    end
    total += value
  end

  loop do
    break if total <= MAX_NUM || aces == 0
    total -= 10
    aces -= 1
  end

  total
end



p total(['A', '5', 'J']) == 16
p total(['A', 'A', '5']) == 17
p total(['A', 'A', 'A', 'A', 'K']) == 14
p total(['A', 'K']) == 21
p total(['5', '6', '2']) == 13