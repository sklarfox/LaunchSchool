=begin
class FluffyCat
  attr_reader :name
  attr_accessor :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def self.what_am_i
    "I'm the FluffyCat class."
  end

  def what_am_i
    "I'm a fluffy cat named #{name}!"
  end

  def increment_age
    self.age += 1
  end
end
=end

class FluffyCat
  attr_reader :name
  attr_accessor :age

  def initialize(name, age)
    @name = name
    @age = age
  end

end

# Implement the FluffyCat class such that the 3 outputs below are true

benny = FluffyCat.new('Benny', 12)

p FluffyCat.what_am_i == "I'm the FluffyCat class."
p benny.what_am_i == "I'm a fluffy cat named Benny!"
benny.increment_age
p benny.age == 13