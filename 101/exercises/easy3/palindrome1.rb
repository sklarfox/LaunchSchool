def palindrome?(word)
  word == word.reverse
end

def palindromic_array?(array)
  array == array.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true


test = [1, 2, 3, 3, 2, 1]
print "\n"
puts palindromic_array?(test) == true