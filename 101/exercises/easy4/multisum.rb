def multisum_og(num)
  total = 0
  (1..num).each do |x|
    if x % 3 == 0 || x % 5 == 0
      total += x
    end
  end
  total
end

def multisum(num)
  multiples = []
  1.upto(num).each do |x|
    if x % 3 == 0 || x % 5 == 0
      multiples << x
    end
  end
  multiples.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
