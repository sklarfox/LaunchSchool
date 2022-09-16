def stringy(num, choice=1)
  str = ''
  counter = choice
  num.times do |x|
    if counter.odd?
      str << '1'
      counter += 1
    else
      str << '0'
      counter += 1
    end
  end
  str
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(7, 0) == '0101010'