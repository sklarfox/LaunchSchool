def yelling?(word)
  size = word.size
  if word[size - 1] == '!'
    true
  else
    false
  end
end


print "Hello. What is your name? "
name = gets.chomp

if yelling?(name)
  puts "HELLO #{name.upcase.chomp('!')}. WHY ARE WE SCREAMING?"
else
  puts "Hello, #{name}."
end