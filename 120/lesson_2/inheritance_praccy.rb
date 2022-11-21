class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

=begin
  The method lookup path is the order in which ruby will look for a particular method when it is called. It is important because Ruby will only
  until the first method is found. This allows you to overwrite certain methods from a superclass. For example, say the superclass Pet had a swim behavior.
    However a subclass of Pet should have a different swim behavior. You can overwrite the method efinition of swim in the subclass, thereby overwriting the 
    superclass' definition.
=end