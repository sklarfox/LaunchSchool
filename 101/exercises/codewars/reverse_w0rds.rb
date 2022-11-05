def reverse_words(str)
  reversed = str.split(' ').map { |word| word.reverse }.join(' ')
  reversed.gsub!(/ /, '  ') if str.match?(/  /)
  reversed
end

p reverse_words('test  test')