=begin
  Clocks should represent a particular time, independent of date
  Clock times will not update in real time, they are static
  You can add or subtract minutes
  Don't mutate a clock object when adding minutes, it should create a new object
  dont use built in time functions, jsut plain counting
  Can compare two clock objects
  use 24H time


  Examples:
      2:00 + 75 minutes => 3:15

    75.divmod(60) => [1, 15]

    [2, 0] : [1, 15] => [3, 15]



  Data Structure

    Encode time in an array with two element ints
    Convert to string only when displaying (to_s)

    Clock class
      constructor method
      takes 1 or 2 arguments. The hour and the minutes (optional)



    add or subtract minutes method (+ and -)
      should create and return a new clock object

    comparison method
      checks if the same time

    to_s
      formats and returns a string representation of the time

  Algo:
    Add time method
      initialize new working time array to the current clocks time
      call divmod on the number of minutes to add with 60 as an arg
      Add the respective elements from the old time and divmod array together
        add the minutes together
        add the hours together
        handle rollover
          if minutes is greater than or equal to 60
            add one to the new hour
            minutes % 60
          if hours is greater than 24
            hours % 24
      make sure the hours is less than 24 (call % 24)

    subtraction
      subtracting X is the same as adding (MIN PER DAY - X)?

      
    


=end

class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
  
  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    @time = [hours, minutes]
  end

  def ==(other)
    @time == other.time
  end

  def +(minutes_to_add)
    current_hour, current_minute = @time
    hours_to_add, minutes_to_add = minutes_to_add.divmod(MINUTES_PER_HOUR)

    new_minute = current_minute + minutes_to_add
    new_hour = current_hour + hours_to_add

    if new_minute >= MINUTES_PER_HOUR
      new_hour += 1
      new_minute %= 60
    end

    new_hour %= HOURS_PER_DAY if new_hour >= HOURS_PER_DAY

    Clock.new(new_hour, new_minute)
  end

  def -(minutes_to_subtract)
    minutes_to_add = MINUTES_PER_DAY - (minutes_to_subtract % MINUTES_PER_DAY)
    self+(minutes_to_add)
  end

  def to_s
    format('%02d:%02d', @time.first, @time.last)
  end

  protected
  attr_reader :time
end