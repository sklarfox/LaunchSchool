=begin 
  Input: a string
  Output: a string, where any word digit is converted to it's number

  Take a sentence, and convert any digit words into their actual digit.


  1. initialize a hash containing all the digit words
  2. clone the string
  2. iterate through the DIGITS hash
      - substitute any instance of a digit's word in the clone string with the digit itself
  3. return the new string
  3. booyah

=end

DIGITS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(string)
  string = string.dup

  DIGITS.each do |word, digit|
    string.gsub!(word, digit)
  end
  DIGITS.values.each do |digit|
    string.gsub!("#{digit} ", digit)
  end
  
  string
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
