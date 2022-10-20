=begin
Problem:
Input: One integer, the number of switches
Output: An array, containing the switches that are on

On a wall of n switches, iterate through n times. On the 1st iteration, flip all switches on.
On the second iteration, flip 2, 4, 6, etc.
On the third iteration, flip 3, 6, 9 etc.
At the end, return an array of which switches are still on.

Data structure:
An array of n elements, which are either nil or the item's index + 1

Algorithm:

Initialize an array of n elements
Initialize an interval variable at value 1
Iterate through the array n times
  Iterate through the array with the index
    toggle! each element if it's (index + 1) % interval == 0
  Increment the interval by 1
Return the array without any 'nil's

Subprocess toggle
  input: an element from an array, the element's index
  output: either an integer or nil

  Algorithm: If the element is truthy, set to nil. Else, set to idx + 1

=end
def toggle(switch, idx)
  switch ? nil : idx + 1
end

def thousand_lights(n)
  switches = Array.new(n)
  interval = 1
  n.times do
    switches.map!.with_index do |switch, idx|
      (idx + 1) % interval == 0 ? toggle(switch, idx) : switch
    end
    interval += 1
  end
  switches.reject { |x| x == nil }
end

p thousand_lights(10) == [1, 4, 9]
p thousand_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]