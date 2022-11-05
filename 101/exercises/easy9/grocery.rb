def buy_fruit(list)
  final_list = []
  list.each do |fruit, quantity|
    quantity.times { final_list << fruit }
  end
  final_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]

