NUMBER_CHARS = {
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
  0 => '0'
}

def integer_to_string(integer)
  digits = integer.digits.map { |digit| NUMBER_CHARS[digit] }
  digits.reverse.join
end

def signed_integer_to_string(integer)
  integer_string = integer_to_string(integer.abs)
  if integer.negative?
    integer_string.prepend('-')
  elsif integer.positive?
    integer_string.prepend('+')
  else
    integer_string
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'