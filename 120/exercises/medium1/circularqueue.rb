=begin

 Nouns:
  Circular queue
  QueueObjects

Verbs:
  Enqueue - add an item to the queue, either in the position after the newest object, or overwrite the oldest object if full
  Dequeue - remove and return the oldest item from the queue, or return nil if empty queue
=end

require 'pry'
require 'pry-byebug'

class QueueObject
  @@number_of_queue_objects = 0

  attr_reader :ranking, :data, :buffer

  def initialize(data)
    @data = data
    @ranking = @@number_of_queue_objects
    @@number_of_queue_objects += 1
  end
end

class CircularQueue
  attr_accessor :buffer, :enqueue_cursor, :size

  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
    @enqueue_cursor = 0
    @size = buffer_size
  end

  def enqueue(data)
    # binding.pry
    @buffer[@enqueue_cursor] = QueueObject.new(data)
    @enqueue_cursor += 1
    @enqueue_cursor = 0 if @enqueue_cursor >= size
  end

  def dequeue
    objects = @buffer.reject { |element| element == nil}
    oldest_obj = objects.min { |a, b| a.ranking <=> b.ranking }
    # binding.pry
    @buffer.delete(oldest_obj)
    return nil if oldest_obj == nil
    oldest_obj.data
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
puts queue.buffer
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil