def word_cap_old(words)
  words.split.map(&:capitalize).join(' ')
end

def  word_cap(words)
  words.split.map do |word|
    chars = word.chars
    chars.map.with_index do |char, idx|
      idx == 0 ? char.upcase : char.downcase
    end.join
  end.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'