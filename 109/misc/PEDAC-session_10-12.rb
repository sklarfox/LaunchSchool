require 'pry'
require 'pry-byebug'

def two_sum(arr, target)
  answer = []
  arr.each.with_index do |num1, idx1| 
    arr[idx1 + 1, arr.size].each.with_index do |num2, idx2|
      if num1 + num2 == target
        answer = [idx1, idx2 + idx1 + 1] 
        break
      end
    end
  end
  puts answer.inspect
  answer
end

p two_sum([2, 11, 7, 15], 9) == [0, 2]

p two_sum([3, 2, 4], 6) == [1, 2]

p two_sum([3, 3], 6) == [0, 1]