=begin
# Problem
given a hash of munster characters
add a category to each character's hash for age category: kid 0 - 17, an adult 18 - 64, senior is aged 65+

# Examples

# Algorithm
iterate through each character
get the character's age group
create an 'age_group' key with a value set to the age group


# Code

=end


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |character, stats|
  case stats['age']
  when 0..17
    stats['age_group'] = 'kid'
  when 18..64
    stats['age_group'] = 'adult'
  else
    stats['age_group'] = 'senior'
  end
end

puts munsters.inspect