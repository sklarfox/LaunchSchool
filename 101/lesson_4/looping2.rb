def select_fruit(produce)
  produce_keys = []
  selected_fruit = {}
  produce.each_key { |key| produce_keys << key }
  counter = 0

  loop do
    break if counter == produce_keys.size
    
    current_key = produce_keys[counter]

    if produce[current_key] == 'Fruit'
      selected_fruit[current_key] = 'Fruit'
    end

    counter += 1
  end

  selected_fruit
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}