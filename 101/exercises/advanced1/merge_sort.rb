=begin

sort the left half
sort the right half
merge the two halves together

=end

require 'pry'
require 'pry-byebug'

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

def merge_sort(array)

  return array if array.size < 2
  
  split = array.size / 2
  left = merge_sort(array[0..split - 1])
  right = merge_sort(array[(split)..-1])

  merge(left, right)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]