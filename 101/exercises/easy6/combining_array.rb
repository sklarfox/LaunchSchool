def merge(arr1, arr2)
  final_arr = []

  arr1.each { |element| final_arr << element unless final_arr.include?(element)}
  arr2.each { |element| final_arr << element unless final_arr.include?(element)}

  final_arr
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]