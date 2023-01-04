PIONEERS = ['Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu']

=begin
  take the 
=end

FIRST_HALF = ('A'..'M').to_a
UPPERCASE = ('A'..'Z').to_a

def decrypt_char(char)
  ascii = char.ord
  if FIRST_HALF.include?(char.upcase)
    ascii += 13
  else
    ascii -= 13
  end
  ascii.chr
end

def decrypt_word(word)
  word.chars.map do |letter|
    if letter == ' '
      ' '
    else
      decrypt_char(letter)
    end
  end.join
end

PIONEERS.each { |name| puts decrypt_word(name) }