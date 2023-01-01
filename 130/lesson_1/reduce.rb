=begin
  initialize a counter variable
  iterate over each item in the array
  set the accumulator to the return value of block of code
  return the accumulator
=end

def reduce(array, acc=nil)
  if acc
    counter = 0
  else
    acc = array[0]
    counter = 1
  end
  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end
  acc
end


p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']