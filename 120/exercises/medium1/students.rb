class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = 'Go for it, brew.'
  end
end

class Undergraduate < Student
end

class Mascot