require 'pry'
require 'pry-byebug'

class CircularQueue
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
    @enqueue_cursor = 0
    @dequeue_cursor = 0
  end

  def enqueue(element)
    binding.pry
    buffer[self.enqueue_cursor] = element
    self.enqueue_cursor += 1
  end

  def dequeue
    buffer[self.enqueue_cursor]
  end

  # private

  attr_accessor :buffer, :enqueue_cursor, :dequeue_cursor

end

queue = CircularQueue.new(3)
# puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1