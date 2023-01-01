LOCATION = self

class Parent
  # LOCATION = self
end

module A
  LOCATION = self
  module B
    # LOCATION = self
    module C
      LOCATION = self
      class Child < Parent
        # LOCATION = self
        def where_is_the_constant
          LOCATION
        end
      end
    end
  end
end

instance = A::B::C::Child.new
puts instance.where_is_the_constant

# What does the last line of code output?
# Comment out LOCATION in Child, what is output now?
# Comment out LOCATION in Module B, what is output now?
# Comment out LOCATION in Parent, what is output now?