def reverse_sentence(string)
  rev_arr = string.split.reverse
  rev_str = ''
  rev_arr.join(' ')
end






puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''