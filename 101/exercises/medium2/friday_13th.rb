=begin
P:
input: integer (year)
output: integer (number of friday the 13ths in that year)

Algorithm:
initialize a counter
Check if every months 13th day is friday. If so, increment the counter

=end

require 'date'

def friday_13th(year)
  counter = 0
  (1..12).each { |month| counter += 1 if Date.new(year, month, 13).friday? }
  counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2