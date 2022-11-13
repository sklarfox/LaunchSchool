class Vehicle
  attr_accessor :make, :model, :current_speed, :color
  attr_reader :year

  @@vehicle_count = 0

  def self.count
    @@vehicle_count
  end

  def speed_up
    self.current_speed += 5
  end

  def brake
    self.current_speed -= 5
  end

  def shut_off
    self.current_speed = 0
  end

  def spray_paint(new_color)
    self.color = new_color
  end

  def self.mileage(distance_traveled, gallons_used)
    distance_traveled / gallons_used
  end

  def to_s
    "This vehicle is a #{make} #{model} made in #{year} and is #{color} and is the best rig."
  end

  def initialize(yr, mk, mo, co)
    @@vehicle_count += 1
    @year = yr
    @make = mk
    @model = mo
    @color = co
    @current_speed = 0
  end

  def age
    calculate_age
  end

  private

  def calculate_age
    Time.new.year - @year
  end

end

module Adwagable
  def convert_to_camper
    "You can sleep in it now!"
  end
end

class MyVan < Vehicle
  include Adwagable
  CAR_YEARS = 10

end

class MyTruck < Vehicle
  TRUCK_YEARS = 5

end

class Estudiante
  attr_accessor :name
  attr_writer :grade
  
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_than?(other)
    grade > other.grade
  end

  protected

  attr_reader :grade
end

rigatoni = MyVan.new(2023, 'Ford', 'Transit', 'Blue')
truckatoni = MyTruck.new(2030, 'Ford', 'F150', 'Green')

bob = Estudiante.new('Bob', 69)
alice = Estudiante.new('Alice', 420)

p bob.name

p alice.better_than?(bob)