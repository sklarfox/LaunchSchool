def real_palindrome?(word)
  word.downcase.delete_if(|char| )
end

def palindrome?(word)
  word == word.reverse
end

def palindromic_array?(array)
  array == array.reverse
end

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false


test = [1, 2, 3, 3, 2, 1]
print "\n"
puts palindromic_array?(test) == true