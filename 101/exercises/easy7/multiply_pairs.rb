def multiply_all_pairs(arr1, arr2)
  results = []
  arr1.each do |num1|
    arr2.each do |num2|
      results << num1 * num2
    end
  end
  results.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

=begin

Algo:
- use nested iteration
- initialize an array to hold the results
- iterate through each item in the first array
  - iterate through each item in the second array
    - multiply the number from each array and add it to the results array
- sort and return the results array
=end