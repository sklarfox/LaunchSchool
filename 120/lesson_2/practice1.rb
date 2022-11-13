class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name='')
    @first_name = first_name
    @last_name = last_name
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(name)
    parts = name.split
    @first_name = parts.first
    @last_name = parts.last if parts.size > 1
  end
end


bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name