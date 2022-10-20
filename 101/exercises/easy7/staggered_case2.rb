ALPHA = (('a'..'z').to_a << ('A'..'Z').to_a).flatten

def staggered_case(string, start_caps: true, non_alpha: false)
  need_upper = start_caps
  string.chars.map.with_index do |char|
    if ALPHA.include?(char)
      new_char = need_upper ? char.upcase : char.downcase
      need_upper = !need_upper
      new_char
    else
      need_upper = !need_upper if non_alpha
      char
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'