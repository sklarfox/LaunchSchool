def greetings(name, info)
  first = name[0]
  middle = name[1]
  last = name[2]
  title = info[:title]
  occupation = info[:occupation]
  "Hello, #{first} #{middle} #{last}! Nice to have a #{title} #{occupation} around."
end


p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
