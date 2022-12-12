=begin
to do
  create a CircularQueue Class  
    takes an integer that represents the buffer size

  enqueue Method
    takes an Integer
    adds that integer to the queue

  dequeue method
    removes oldest object from queue
    returns that Object
    returns nil if queue is empty

  track which number is the oldest

  
=end

class CircularQueue
  attr_reader :buffer
  attr_accessor :enqueue_cursor, :dequeue_cursor

  def initialize(size)
    @buffer = Array.new(size)
    @enqueue_cursor = 0
    @dequeue_cursor = 0
  end

  def enqueue(int)
    self.enqueue_cursor = 0 if enqueue_cursor > (buffer.size - 1)
    self.dequeue_cursor += 1 if buffer[enqueue_cursor] != nil
    self.dequeue_cursor = 0 if dequeue_cursor > (buffer.size - 1)
    buffer[enqueue_cursor] = int
    self.enqueue_cursor += 1
  end

  def dequeue
    obj = buffer[dequeue_cursor]
    buffer[dequeue_cursor] = nil
    self.dequeue_cursor += 1 unless obj == nil
    self.dequeue_cursor = 0 if dequeue_cursor > (buffer.size - 1)
    obj
  end
end


queue = CircularQueue.new(3)
# # p queue.buffer
#  queue.enqueue(2)
#  queue.enqueue(3)
# p queue.buffer
# p queue.dequeue
# p queue.dequeue
# p queue.buffer
queue.dequeue == nil

queue.enqueue(1) # [ 1, nil, nil]

# p queue.enqueue_cursor #1
# p queue.dequeue_cursor #0
queue.enqueue(2) # [ 1, 2, nil]

# p queue.enqueue_cursor #2
# p queue.dequeue_cursor #2
queue.dequeue == 1 # [ nil, 2, nil]

# p queue.enqueue_cursor #
# p queue.dequeue_cursor #1

queue.enqueue(3) # [ nil, 2, 3]

# p queue.enqueue_cursor #3
# p queue.dequeue_cursor #1
queue.enqueue(4) # [ 4, 2, 3]

# p queue.enqueue_cursor #1
# p queue.dequeue_cursor #1
queue.dequeue == 2 # [ 4, nil, 3]

# p queue.enqueue_cursor #1
# p queue.dequeue_cursor #2
queue.enqueue(5) # [ 4, 5, 3]

# p queue.enqueue_cursor #2 
# p queue.dequeue_cursor #2
queue.enqueue(6) # [ 4, 5, 6]

# p queue.enqueue_cursor #3
# p queue.dequeue_cursor #3
queue.enqueue(7) # [7, 5, 6]

# p queue.enqueue_cursor #1
# p queue.dequeue_cursor #1
puts queue.dequeue == 5 # [7, nil, 6]
# p queue.enqueue_cursor #1
# p queue.dequeue_cursor #0

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