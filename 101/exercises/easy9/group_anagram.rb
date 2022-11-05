=begin
  Input: An array of words
  Output: Multiple arrays printed out on seaparate lines

  Problem: Take an array of words, and print arrays of groups of words which are anagrams, each on a seaprate line

  Algorithm:
    Initialize an array to hold previously collected words
    Iterate through each item in the array
      Initialize an array to hold a group of anagrams
      Add the first word to the array
        Iterate through each subsequent item in the array
          if it is an anagram AND it isn't in the previously collected array
            Add it to the previously collected and current group array
      Print the group if it contains more than 1 item

  Anagram subprocess:
    Convert both words to an array and sort the chars, check for equality


=end

def anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def group_anagram(words)
  ignore_words = []
  words.each.with_index do |start_word, index|
    current_group = [start_word]
    words[(index+1)..-1].each do |word|
      if anagram?(start_word, word) && !ignore_words.include?(word)
        ignore_words << word
        current_group << word
      end
    end
    puts current_group.inspect if current_group.size > 1
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

  group_anagram(words)