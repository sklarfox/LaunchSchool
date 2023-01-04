=begin
input: array
output: array

iterate from 1 up to given integer
ad


=end

def divisors(int)
  result = []
  (1..int).to_a.each do |divisor|
    result << divisor if int / divisor == int / divisor.to_f
  end
  result
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute