=begin
P:
Input: text file
Output: a string

Goal: given a block of text, we want to substitute each special block with it's respective word type

Data:
hash. each key is to be a word type, values will be an array of that type of words



Algorithm:

  innitialize the hash with random words
  open a file
  read the file
  iterate through each element in the hash
    substitute all instances of that key (ex %{verb}) with a sample from the value array )(ex. [cat, dog, bird])
=end

replacement_words = {
  "%{noun}" => ['fox', 'dog', 'head', 'leg'],
  "%{verb}" => ['jumps', 'lifts', 'bites', 'licks'],
  "%{adverb}" => ['easily', 'lazily', 'noisily', 'excitedly'],
  "%{adjective}" => ['quick', 'lazy', 'sleepy', 'ugly']
}

file = File.open("madlib_text.txt")
text = file.read

replacement_words.each do |type, words|
  while text.match?(type)
    text.sub!(type, words.sample)
  end
end

puts text
