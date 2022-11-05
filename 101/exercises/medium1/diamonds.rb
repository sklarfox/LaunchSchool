=begin
Input: an integer
Output: an ascii diamond on the screen

Given an integer, print a diamond that is n digits wide in the middle, and tapers down to a single * at both ends. Each row should decrease by 2 * each time

Algorithm:

Print a row with one *, centered around n
print a row with three *, centered around n
Repeat up to and excluding n asterices
Print a row with n astericies
Print a row with n - 2 astericies
Repeat down to and including 1 asterix


=end

def diamond_as(n)
  # print top half of diamond, including waist
  (1...n).each do |count|
    next if count.even?
    puts ('*' * count).center(n)
  end

  # print bottom half of diamond, excluding waist
  (n.downto(1)).each do |count|
    next if count.even?
    puts ('*' * count).center(n)
  end
end

def print_row(grid_size, distance_from_center)
  if (grid_size - 1) / 2 == distance_from_center
    puts '*'.center(grid_size)
  else
    number_of_spaces = (grid_size - 2 * distance_from_center) - 2
    stars = '*' + ' ' * number_of_spaces + '*'
    puts stars.center(grid_size)
  end
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(9)