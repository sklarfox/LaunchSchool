items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*items, wheat|
  puts items.join(', ')
  puts wheat
end

gather(items) do |apples,*items,wheat |
  puts apples
  puts items.join(', ')
  puts wheat
end

gather(items) do |apples,*remaining |
  puts apples
  puts remaining.join(', ')
end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, #{wheat}"
end