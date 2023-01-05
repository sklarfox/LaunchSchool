items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| items.each { |item| puts "We've got #{item}!"}}

gather(items) {|items| puts items.join(', ')}