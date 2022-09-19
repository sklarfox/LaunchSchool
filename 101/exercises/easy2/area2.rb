SQM_TO_SQFT = 10.7639
SQFT_TO_SQIN = 144
SQFT_TO_SQCM = 929.03


puts "What is the room width in feet?"
width = gets.chomp.to_f

puts "What is the room length in feet?"
length = gets.chomp.to_f

area = (width * length).round(3)
area_in = (area * SQFT_TO_SQIN).round(3)
area_cm = (area * SQFT_TO_SQCM).round(3)
puts "The room area is #{area} square feet (#{area_in} square inches, #{area_cm} square centimeters)."