
=begin
Input: array of integers, target integer
Output: array of 2 integers, whose sum is the target value

Goal: return the first two elements that add up to the target value.

Rules:
  if none, return nil
  if multiple pairs, the pair whose second index is lower should be returned


Algorithm:
    Initialize an array to contain seen digits
    Iterate over every item in the array
      if the element is in the seen array more than twice, skip it
      iterate over every item in the seen array
        if the sum of the seen number and the current number is the target, return those values in an array
      add the current item into the seen array

=end

def sum_pairs(array, target)
  seen = []
  array.each do |current_num|
    next if seen.count(current_num) > 2
    seen.each do |seen_num|
      return [seen_num, current_num] if seen_num + current_num == target
    end
    seen << current_num
  end
  nil
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]


p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]