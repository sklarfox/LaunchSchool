def oddities(arr)
  index = 0
  new_arr = []
  while index < arr.size
    new_arr << arr[index]
    index += 2
  end
  new_arr
end

def evensies(arr)
  index = 1
  evens = Array.new
  while index < arr.size
    evens << arr[index]
    index += 2
  end
  evens
end

def oddities2(arr)
  odd_elements = []
  arr.each_with_index { |item, index| odd_elements << item if index % 2 == 0 } 
  odd_elements
end

def oddities3(arr)
  odd_elements = []
  while arr.size > 0
    odd_elements << arr.shift
    arr.shift
  end
  odd_elements
end

numbers = [1, 2, 3, 4, 5, 6]


puts oddities3(numbers) == [1, 3, 5]