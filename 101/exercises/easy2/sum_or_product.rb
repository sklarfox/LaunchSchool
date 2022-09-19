value = 0

while value < 1
  print "Please input a number greater than 0: "
  value = gets.chomp.to_i
end

choice = ''

loop do
  print "Enter 's' to compute the sum, 'p' to compute the product: "
  choice = gets.chomp
  break if choice == 's' || choice == 'p'
  puts "Invalid input."
end

sum = 0
product = 1

case choice
when 's'
  sum = 1.upto(value).reduce(:+)
  puts "The sum of the numbers between 1 and #{value} is #{sum}"
when 'p'
  product = 1.upto(value).reduce(:*)
  puts "The product of the numbers between 1 and #{value} is #{product}"
end
