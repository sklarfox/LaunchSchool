LOWERCASE = ('a'..'z').to_a

def swapcase(string)
  string.chars.map do |char| 
    LOWERCASE.include?(char) ? char.upcase : char.downcase
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
