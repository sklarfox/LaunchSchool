munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters_males = munsters.select do |_, stats|
  stats['gender'] == 'male'
end

age_males = 0

munsters_males.each do |_, stats|
  age_males += stats['age']
end

p age_males