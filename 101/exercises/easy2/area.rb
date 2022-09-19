puts "What is the room width in meters?"
width = gets.chomp.to_f

puts "What is the room length in meters?"
length = gets.chomp.to_f

area = width * length
area_ft = area * 10.7639
puts "The room area is #{area} square meters (#{area_ft} square feet)."