=begin

https://medium.com/@gcpinckert/group-study-for-launch-schools-rb129-assessment-69630264cc5a

Classes and objects
Use attr_* to create setter and getter methods
How to call setters and getters
Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope
Instance methods vs. class methods
Method Access Control
Referencing and setting instance variables vs. using getters and setters
Class inheritance, encapsulation, and polymorphism
Modules
Method lookup path
self
Calling methods with self
More about self
Reading OO code
Fake operators and equality
Working with collaborator objects

=end

# Referencing and setting instance variables vs. using getters and setters

class Person 
  def initialize(name, number)
    @name = name.split
    @number = number
  end

  def name
    "#{@name.first} #{@name.last[0]}."
  end

  def number
    digits = @number.split('-')
    "#{digits[0]}-#{digits[1]}-XXXX"
  end

  def married_name=(new_name)
    @name[1] = new_name
  end
end

#implement so that this stuff works

melissa = Person.new('Melissa Smith', '555-867-5309')
# puts melissa.name #Melissa S.
# puts melissa.number #555-867-XXXX
melissa.married_name = "Johnson"
puts melissa.name #Melissa J.