def reverse_words(str)
  arr = str.split
  arr.each do |x|
    x.reverse! if x.length >= 5
  end
  arr.join(' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS