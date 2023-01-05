birds = %w(raven finch hawk eagle)
# p birds # => ['raven','finch','hawk','eagle']

=begin
  write a method
  input: array as argument, will yield to a block
  output: 
=end

def passing(array)
  yield(array)
end

passing(birds) { |_, _, *raptors| p raptors }