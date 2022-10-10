require 'pry'
require 'pry-byebug'

MAX_WIDTH = 76
def print_row(width, edge, filler)
  puts edge + filler * (width + 2) + edge
end

def print_in_box(words)
  width = words.length
  if width > MAX_WIDTH
    print_row(MAX_WIDTH, '+', '-')
    print_row(MAX_WIDTH, '|', ' ')
    idx = 0
    until idx > width
      puts "| #{words[idx, MAX_WIDTH].center(MAX_WIDTH)} |"
      idx += MAX_WIDTH
    end
    print_row(MAX_WIDTH, '|', ' ')
    print_row(MAX_WIDTH, '+', '-')
  else
    print_row(width, '+', '-')
    print_row(width, '|', ' ')
    puts '| ' + words + ' |'
    print_row(width, '|', ' ')
    print_row(width, '+', '-')
  end
end

print_in_box('To boldly go where no one has gone before, and yo ho ho and a bottle of rums and a whole bunch of other stuff. So asdkldfajlk;fdajkl;dfsajkl;dafsjk;lsdfjkl;dfsajkl;adfsabsdf')

print_in_box('')