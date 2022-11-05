
PUNC = ['-', "'", ',', '.']

  def scramble_word(word)
    chars = word.chars
    scrambled = Array.new(word.size)
    chars.each.with_index { |char, idx| scrambled[idx] = char if PUNC.include?(char) }
    scrambled[0] = chars.shift
    scrambled[-1] = chars.pop
    PUNC.each { |char| chars.delete(char) }
    chars.sort!
    scrambled.each.with_index { |_, idx| scrambled[idx] = chars.shift unless scrambled[idx] }
    scrambled.join
  end

  p scramble_word('professionals')