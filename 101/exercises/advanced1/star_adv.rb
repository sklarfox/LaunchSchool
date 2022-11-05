=begin
Problem: to output an 8 pointed star, in an n x n grid.

input: integer
output: displaying a star

rules:
smallest star is a 7
n will be odd

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *



star(9)

*   *   *
 *  *  *
  * * *

   ***
*********
   ***

  * * *
 *  *  *
*   *   *


subprocess: print a hat or a foot row
    - print a row with a '*' in the center and a '*' on either side, separated by a buffer, centered on n

Algorithm:
  print the hat
    - calculate how many rows the hat will be
    - iterate from the number of rows down to 1
      - print a row with the iteration num sized buffer, centered on grid width
  print the waist
    - print a row of 3 '*' centered on n
    - print a row of n '*'
    - print a row of 3 '*' centered on n
  print the boots (hat mirrored)
    - iterate from 1 up to number of rows
      - print a row with iteration num sized buffer, centerd on grid width

=end


def print_row(row_width, buffer)
  puts ('*' + ' ' * buffer + '*' + ' ' * buffer + '*').center(row_width)
end

def star(n)
  # Print the hat
  hat_size = (n - 3) / 2
  hat_size.downto(0) do |idx|
    print_row(n, idx)
  end

  # Print the waist
  puts ('*' * n)

  # Print the boots
  0.upto(hat_size) do |idx|
    print_row(n, idx)
  end
end

star(69)