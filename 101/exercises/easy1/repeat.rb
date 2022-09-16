def repeat(string, num)
  num.times {puts string}
end

print "Input: "
input = gets.chomp

print "Times: "
times = gets.chomp.to_i

repeat(input, times)