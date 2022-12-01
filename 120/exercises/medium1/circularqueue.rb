=begin
 A circular queue is a collection of objects


 Nouns:
  Circular queue
  Objects

Verbs:
  Enqueue - add an item to the queue, either in the position after the newest object, or overwrite the oldest object if full
  Dequeue - remove and return the oldest item from the queue, or return nil if empty queue
=end

require 'pry'
require 'pry-byebug'

class CircularQueue
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
  end

  def enqueue(element)

  end

  def dequeue

  end
end

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1