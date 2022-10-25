UPPERCASE = ('A'..'Z').to_a

def uppercase?(string)
  clean_string = string.delete('^a-zA-Z')
  clean_string.chars.all? { |char| UPPERCASE.include?(char) }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true