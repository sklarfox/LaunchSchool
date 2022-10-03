arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr_incremented = arr.map do |subhash|
  tmp = subhash.map do |key, value|
    [key, value + 1]
  end
  tmp.to_h
end

puts arr_incremented.inspect