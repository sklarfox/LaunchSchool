class Human  # Problem received from Raul Romero
  attr_reader :name 
  
  def initialize(name)
    @name = name
  end

  def equal?(other)
    self.class == other.class
  end

  def +(other)
    name + other.name
  end
 
end

gilles = Human.new("gilles") 
anna = Human.new("gilles") 

puts anna.equal?(gilles) #should output true # 
puts anna + gilles # should output annagilles 