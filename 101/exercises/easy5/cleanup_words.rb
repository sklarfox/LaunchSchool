=begin
 P:
  take a string of all lower case chars, and return a new string with all nonalpha chars replaced by a space. 
  Any consecutive spaces should be condensced to a single space

 E:
  below
 D: 
  array for operating on chars

 A:
  turn the string into an array DONE
  replace any non-alphabetical char with a space DONE
  remove multiple spaces
    reject any character that is a space preceded by another space

  return the string

=end

def cleanup(string)
  chars_array = string.chars.map do |char| 
    ('a'..'z').include?(char) ? char : ' '
  end

  chars_array = chars_array.reject.with_index do |char, i|
    next if i == 0
    char == ' ' && chars_array[i - 1] == ' '
  end
  chars_array.join
end


p cleanup("---what's my +*& line?") == ' what s my line '