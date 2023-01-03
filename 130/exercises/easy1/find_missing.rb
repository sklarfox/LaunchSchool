=begin

input: array
output: array, of any size

given a list of sorted integers, return a new array containing all of the missing integer

create an array containing all integers from the first to the last of the input
reject all that are included in the original array
return that array

=end

def missing_as(array)
  (array[0]..array[-1]).to_a.reject { |n| array.include?(n) }
end

def missing_ls(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

def missing(array)
  (array[0]..array[-1]).to_a - array
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []