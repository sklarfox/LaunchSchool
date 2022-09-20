print "Please write word or multiple words: "
input = gets.chomp

count = 0
input.each_char { |char| count += 1 if char != ' ' }

puts "There are #{count} characters in \"#{input}\""