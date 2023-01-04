def step(start, finish, step)
  counter = start
  until counter > finish
    yield(counter)
    counter += step
  end
  nil
end

p step(1, 10, 3) { |value| puts "value = #{value}" }