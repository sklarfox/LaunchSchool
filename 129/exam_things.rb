class ZooAnimalCategorization
end

module Flyable
  def fly; end
end

module Sociable
  def social; end
end

class Animal
  @@number_of_animals = 0

  def initialize
    @animal_id = @@number_of_animals
    @weight = calc_weight(self.class::LOW_WEIGHT, self.class::HIGH_WEIGHT)
    @body_temperature = 'warm-blooded'
    @@number_of_animals += 1
  end

  def to_s
    "========================\n" +
    "species: #{self.class}\n" +
    "animal id: #{@animal_id}\n" +
    "weight: #{@weight}\n" +
    "diet: #{@diet}\n" +
    "body temp: #{@body_temperature}\n" +
    "========================\n"
  end

  private

  def calc_weight(low, high)
    (low..high).to_a.sample
  end
end

class Carnivore < Animal
  def initialize
    @diet = 'meat'
    super
  end
end

class Predator < Carnivore
  def hunt(prey)
  end
end

class Herbivore < Animal
  def initialize
    @diet = 'vegetation'
    super
  end
end

class Zebra < Herbivore
  LOW_WEIGHT = 770
  HIGH_WEIGHT = 990

  include Sociable
end

class Hawk < Predator
  LOW_WEIGHT = 12
  HIGH_WEIGHT = 15

  include Flyable
end

class Tiger < Predator
  LOW_WEIGHT = 200
  HIGH_WEIGHT = 680
end

class Koala < Herbivore
  LOW_WEIGHT = 10
  HIGH_WEIGHT = 30
end

class Parrot < Herbivore
  LOW_WEIGHT = 1
  HIGH_WEIGHT = 3

  include Flyable
  include Sociable
end