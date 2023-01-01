class FluffyCat
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def change_weight(new_weight)
    self.weight = new_weight
  end

  def heavier_than?(other_cat)
    weight > other_cat.weight
  end

  protected
  
  attr_reader :weight

  private

  attr_writer :weight
end

benny = FluffyCat.new('Benny', 12)
cadbury = FluffyCat.new('Cadbury', 15)

p benny.name # => 'Benny' 
# p benny.weight # => NoMethodError
# p benny.weight = 10 # => NoMethodError
# p benny.heavier_than?(cadbury) # => false
# p benny.change_weight(16)
# p benny.heavier_than?(cadbury) # => false