def swap_word(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(string)
  words = string.split.map { |word| swap_word(word) }
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
