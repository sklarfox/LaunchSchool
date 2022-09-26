def titleize(words)
  words_array = words.split(' ')
  words_array.map! do |word|
    word.capitalize
  end
  words_array.join(" ")
end

words = "the flintstones rock"

title = titleize(words)

p title == "The Flintstones Rock"
