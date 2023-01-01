# Instance variables, class variables, and constants, 
# including the scope of each type and how inheritance can affect that scope

class Shape
  @@number_of_shapes = 0

  attr_reader :area

  def self.number_of_shapes
    @@number_of_shapes
  end
end

class Square < Shape
  NUMBER_OF_SIDES = 4
  def initialize(side)
    @@number_of_shapes += 1
    @area = side * side
  end

end

class Triangle < Shape
  NUMBER_OF_SIDES = 3
  def initialize(side1, side2)
    @@number_of_shapes += 1
    @area = (side1 * side2) / 2
  end
end


square = Square.new(4)
triangle = Triangle.new(4, 3)

p Shape.number_of_shapes == 2
p square.area == 16
p triangle.area == 6
p Square::NUMBER_OF_SIDES == 4
p Triangle::NUMBER_OF_SIDES == 3



=end
#### BELOW

# Instance variables, class variables, and constants, 
# including the scope of each type and how inheritance can affect that scope

class Shape
  @@number_of_shapes = 0

  attr_reader :area

  def self.number_of_shapes
    @@number_of_shapes
  end
end

class Square < Shape

end

class Triangle < Shape

end


square = Square.new(4)
triangle = Triangle.new(4, 3)

# Modify the classes above such that the outputs are all true. 
# Only add code to the Square and Triangle classes, not the Shape class.

p Shape.number_of_shapes == 2
p Square.number_of_shapes == 2
p square.area == 16
p triangle.area == 6
p Square::NUMBER_OF_SIDES == 4
p Triangle::NUMBER_OF_SIDES == 3

