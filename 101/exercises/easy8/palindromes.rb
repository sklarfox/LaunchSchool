

def leading_substrings(string)
  substrings = []
  counter = 1
  loop do
    substrings << string[0, counter]
    counter +=1
    break if counter > string.size
  end
  substrings
end

def substrings(string)
  all_substrings = []
  (0...string.size).each do |start_index|
    current_substring = string[start_index..-1]
    all_substrings << leading_substrings(current_substring)
  end
  all_substrings.flatten
end

def palindromes(string)
  substrings(string).select do |substring|
    substring = substring.delete('^a-zA-Z0-9')
    p substring
    substring == substring.reverse && substring.size > 1
  end
end


p palindromes('abcd') == []
p palindromes('ma5dam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
=begin

p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
=end