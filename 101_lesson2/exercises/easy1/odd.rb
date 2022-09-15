def is_odd?(num)
  return false if (num) % 2 == 0
  return true
end


def is_odd2?(num)
  num % 2 != 0
end


puts is_odd2?(1)
puts is_odd2?(-5)
puts is_odd2?(0)
puts is_odd2?(30)