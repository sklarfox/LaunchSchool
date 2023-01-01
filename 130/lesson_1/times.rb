def times(num)
  counter = 0
  loop do
    yield(counter)
    counter += 1
    break if counter == num
  end
  num
end

times(5) do |num|
  puts num
end