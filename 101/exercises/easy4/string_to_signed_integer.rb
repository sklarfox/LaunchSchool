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
  '0' => 0,
  '-' => '-',
  '+' => '+'
}

def string_to_signed_integer(string)
  digits = string.chars.map { |x| DIGITS[x] }
  negative = false

  if digits[0] == '-'
    digits.shift
    negative = true
  elsif digits[0] == '+'
    digits.shift
  end

  final_integer = 0

  digits.each do |digit|
    final_integer *= 10
    final_integer += digit
  end

  if negative
    return final_integer * -1
  else
    final_integer
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100