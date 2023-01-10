=begin
  Problem:
    Implement a Simple Linked List
    Each object contains a field for data
    Each object in the list should contain a pointer to another object in the linked list (a next variable)

  Examples:
    Element class
      constructor method takes 1 argument (the datum) and an optional second argument, a diff element object
      datum getter method
      tail? method -> says if it is the last object in the list (i.e. no next)
      next method -> returns the next object
    
    SimpleLinkedList Object
      size method -> tells you how big the list is (instance variable, increment when pushing?)

      empty? method

      peek method -> returns the head object's datum

      push method
        accepts 1 piece of data, instantiates a new Element object with that datum
        will assign the old head to the new object's next field, and make that new object the head
        will increment the size of the list

      pop method
        will take the head off, and make the head's next object the new head
        will decrement the size of the list

      head method to give the head

      from_a method
        TODO: convert an array into a linked list. probably will iterate

      to_a method
        TODO: convert the entire list to an array

      reverse method
        TODO: reveres the order of the list
        convert to an array
        reverse that array
        convert that array back to a list, new object


      


  Data:
    Each object contains some type of data, can be anything (isntance variable @datum)
=end

require 'pry'
require 'pry-byebug'

class Element
  attr_reader :datum
  attr_accessor :next
  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    !self.next
  end
end

class SimpleLinkedList
  attr_reader :head, :size
  def initialize
    @size = 0
  end

  def empty?
    size == 0
  end

  def push(datum)
    self.head = Element.new(datum, head)
    self.size += 1
  end

  def peek
    empty? ? nil : head.datum
  end

  def pop
    popped_item = head
    self.head = popped_item.next
    self.size -= 1
    popped_item.datum
  end

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    array.reverse.each { |element| new_list.push(element) } if array
    new_list
  end

  def to_a
    array = []
    current_item = head
    until !current_item
      array << current_item.datum
      current_item = current_item.next
    end
    array
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

  private

  attr_writer :head, :size
end

