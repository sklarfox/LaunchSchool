ALPHANUMERIC = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9)

def real_palindrome?(phrase)
  # downcase the phrase
  phrase = phrase.downcase
  phrase_array = phrase.chars
  phrase_array.delete_if { |char| !ALPHANUMERIC.include?(char) }
  phrase = phrase_array.join
  palindrome?(phrase)
  # run palindrome on std word
end

def palindrome?(word)
  word == word.reverse
end

def palindromic_array?(array)
  array == array.reverse
end

def palindromic_number?(number)
  num_string = number.inspect
  palindrome?(num_string)
end

=begin puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?('madam') == true
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false 
=end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
