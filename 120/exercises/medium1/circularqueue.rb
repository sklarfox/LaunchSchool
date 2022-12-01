=begin
 A circular queue is a collection of objects


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

  attr_reader :ranking

  def initialize(datatron2000)
    @data = datatron2000
    @ranking = @@number_of_queue_objects
    @@number_of_queue_objects += 1
  end
end

class CircularQueue
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
    binding.pry
  end

  def enqueue(element)

  end

  def dequeue

  end

  private

  def oldest_object
    @buffer.min { |a, b| a.ranking <=> b.ranking }
  end

  def newest_object

  end
end

queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1