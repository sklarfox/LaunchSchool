# puts [2, 3, 5].inject(1, &:+)

puts [2, 3, 5].inject(1) { |total, num| num + num }
puts [2, 3, 5].inject { |total, num| total + num }
puts [2, 3, 5].inject { |total, num| num + num }
puts [2, 3, 5].inject(1) { |total, num| total + num }