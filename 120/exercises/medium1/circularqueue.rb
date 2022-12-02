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

  attr_reader :ranking

  def initialize(datatron2000)
    @data = datatron2000
    @ranking = @@number_of_queue_objects
    @@number_of_queue_objects += 1
  end
end

class CircularQueue
  attr_accessor :buffer, :enqueue_cursor

  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
    @enqueue_cursor = 0
  end

  def enqueue(data)
    # TODO PEDAC?
  end

  def dequeue
    # TODO
  end

  private

  def reset_enqueue_cursor
    if full?
      self.enqueue_cursor = oldest_object_index
    else
      self.enqueue_cursor = oldest_object_index + 1
    end
    self.enqueue_cursor = 0 if self.enqueue_cursor >= self.buffer.size
  end

  def full?
    !@buffer.any?(nil)
  end

  def oldest_object_index
    @buffer.min { |a, b| a.ranking <=> b.ranking }
  end

  def newest_object

  end
end

queue = CircularQueue.new(3)
# puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
# puts queue.dequeue == 1