def kebabize(str)
  p str
  chars = str.chars
  (0..9).each { |num| chars.delete(num.to_s) }
  chars[0].downcase!
  split_words = []
  loop do
    new_word = ''
    loop do
      current_char = chars.shift.downcase
      new_word << current_char if ('a'..'z').include?(current_char)
      break if chars.empty? || chars[0] == chars[0].upcase
    end
    split_words << new_word unless new_word.empty?
    break if chars.empty?
  end
  split_words.join('-')
end

p kebabize("w0fr20")