def compute(input=nil)
  if block_given? && input
    yield(input)
  else
    'Does not compute.'
  end
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'
p compute('balls') { |input| "Computing: #{input}"} == "Computing: balls"
p compute('balls') == 'Does not compute.'
p compute('balls') { |input| puts "Ligma" + input } == nil