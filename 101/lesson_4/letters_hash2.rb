# Create an array containing all letters
# Initialize a hash for the counts


# Iterate through each letter
  # run count on the statement for each letter
  # create that item in the hash unless nil


statement = "The Flintstones Rock"
letters = ('A'..'Z').to_a + ('a'..'z').to_a
result = {}

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency unless letter_frequency == 0
end


puts result.inspect



1
3
nil
nil


1
2
nil
nil