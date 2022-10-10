def crunch(string)
  array = string.chars
  crunched = array.reject.with_index do |char, idx|
    next if idx == 0
    char == array[idx - 1]
  end
  crunched.join
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''