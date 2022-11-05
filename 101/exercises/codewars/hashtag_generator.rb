def generateHashtag(str)
  words = str.split.map { |word| word[0].upcase + word[1..-1] }.join
  "\##{words}"
end

p generateHashtag('test')