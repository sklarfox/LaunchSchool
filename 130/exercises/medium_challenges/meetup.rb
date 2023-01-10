=begin
Problem:
  Determine the exact calendar date based off the description of it's position in a month.
  Ex: First monday of December 2022.
      Second Friday of January 2021.
      etc.
  
  Fifth of a day may not happen, return nil if so

  strings are case insensitive

Data Structure:

Meetup class
  constructor method takes a year and a month as an argument

  day method takes two strings as arguments
    one of the descriptor
    the day of the week
    should return a date object

Algorithm:
    day method

    input: two strings, descriptor and a day of the week

    output: a date object

    create a symbol from the input day for the correct bool method for day of week

    Create a new date object for the first day of the target month

    increment and reassign days 1 at a time until it is the first correct day of the month

    add the appropriate number of additional days to get 1st 2nd 3rd etc (0, 7, 14, 21, 28)

    check the original month and the new month are the same, return nil otherwise

=end

require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day, descriptor)
    return teenth(day) if descriptor.downcase == 'teenth'
    return last(day) if descriptor.downcase == 'last'

    date = Date.new(@year, @month)
    day_symbol = to_day_sym(day)

    until date.send(day_symbol)
      date += 1
    end

    date += days_to_add(descriptor)

    date.month == @month ? date : nil
  end


  private

  def teenth(day)
    date = Date.new(@year, @month, 13)
    day_symbol = to_day_sym(day)
    until date.send(day_symbol)
      date += 1
    end
    date
  end

  def last(day)
    date = Date.new(@year, @month, -1)
    day_symbol = to_day_sym(day)
    until date.send(day_symbol)
      date -= 1
    end
    date
  end

  def to_day_sym(day)
    (day.downcase + '?').to_sym
  end

  def days_to_add(descriptor)
    case descriptor.downcase
    when 'first' then 0
    when 'second' then 7
    when 'third' then 14
    when 'fourth' then 21
    when 'fifth' then 28
    end
  end
end

meetup = Meetup.new(2013, 3)
p meetup.day('Monday', 'second')