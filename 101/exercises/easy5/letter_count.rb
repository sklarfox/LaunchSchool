require 'pry'
require 'pry-byebug'

def word_sizes(string)
  clean_string = string.downcase.delete '^a-zA-Z '
  sizes = Hash.new(0)
  clean_string.split.each { |word| sizes[word.size] += 1 }
  sizes
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?")  == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}