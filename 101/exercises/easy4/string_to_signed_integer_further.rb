=begin
# create a hash containing the string characters and their appropriate integer
create a final integer value, initialze at 0

# iterate through the string
for each character
  multiply the final integer by 10
  convert char to the appropriate integer
  add to the final integer
  
=end
DIGITS = {
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '0' => 0
}

DIGITS_HEX = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'a' => 10,
  'b' => 11,
  'c' => 12,
  'd' => 13,
  'e' => 14,
  'f' => 15
}
def string_to_integer(string)
  final_integer = 0
  string.each_char do |char|
    final_integer *= 10
    final_integer += DIGITS[char]
  end
  final_integer
end

def hexadecimal_to_integer(string)
  # Convert chars into an array of integers
  digits = string.downcase.chars.map { |char| DIGITS_HEX[char] }
  
  exponent = string.length - 1
  value = 0
  digits.each do |digit|
    value += digit * (16 ** exponent)
    exponent -= 1
  end
  value
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_signed_integer(string[1..-1])
  else string_to_signed_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100