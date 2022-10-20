def staggered_case_as(string)
  string.chars.map.with_index do |char, idx|
    idx.odd? ? char.downcase : char.upcase
  end.join
end

def staggered_case(string, start_caps: true)
  result = ''
  need_upper = start_caps 
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end


p staggered_case('I Love Launch School!', false) # == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') # == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'

=begin
  A keyword argument is like a positional argument, however it allows you
  omit some arguments if not needed, and give the arguments in any order (if multiple).
  It's basically giving a hash to the argument with all of it's parametrons in a hash, 
  where order is unimportant.
=end