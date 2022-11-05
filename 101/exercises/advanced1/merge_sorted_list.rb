=begin
  Problem:
    Input: 2 arrays
    Output: 1 array

  Goal: Return a single array, which is composed of all the elements in both given arrays, in sorted order

  Rules:
  Explicit: sort method is not allowed. I.E. the array must be built in sorted order
            
  Implicit: empty arrays can be given as either array
            only integers

  [1, 5, 9]
  [2, 6, 8]
  
  initialize a results array
  compare the first digit of each array
    if the left one is smaller, shift that to the result
    if the right one is smaller, shift that to the result
    if they're the same, shift both to the result
    if one is nil, shift the other one
  repeat until both are empty?

=end

def merge(arr1, arr2)
  arr1 = arr1.clone
  arr2 = arr2.clone
  
  result = []
  
  loop do
    if arr1.empty?
      result << arr2.shift
    elsif arr2.empty?
      result << arr1.shift
    else
      case arr1.first <=> arr2.first
      when -1 then result << arr1.shift
      when 1 then result << arr2.shift
      when 0 then result << arr1.shift
      end
    end
    break if arr1.empty? && arr2.empty?
  end

  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]