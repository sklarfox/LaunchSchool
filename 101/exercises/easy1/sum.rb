def sum(num)
  arr = Array.new
  num.to_s.each_char do |x|
    arr.push(x.to_i)
  end
  arr.reduce(:+)
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45