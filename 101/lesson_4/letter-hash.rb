statement = "The Flintstones Rock"
array = statement.chars


counts_hash = array.each_with_object({}) do |char, counts|
  if counts.include?(char)
    counts[char] += 1
  else
    counts[char] = 1
  end
end

puts counts_hash.inspect




# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }