arr = []

print "Please input the 1st number: "
arr << gets.chomp.to_i
print "Please input the 2nd number: "
arr << gets.chomp.to_i
print "Please input the 3rd number: "
arr << gets.chomp.to_i
print "Please input the 4th number: "
arr << gets.chomp.to_i
print "Please input the 5th number: "
arr << gets.chomp.to_i
print "Please input the last number: "
search = gets.chomp.to_i

if arr.include?(search)
  puts "The number #{search} appears in #{arr.inspect}"
else
  puts "The number #{search} does not appear in #{arr.inspect}"
end