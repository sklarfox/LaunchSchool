class Shelter
  def initialize
    @adoption_ledger = Hash.new
  end

  def adopt(owner, pet)
    if adoption_ledger.has_key?(owner)
      adoption_ledger[owner] << pet
    else
      adoption_ledger[owner] = [pet]
    end
    owner.number_of_pets += 1
  end

  def print_adoptions
    adoption_ledger.each do |owner, pets_arr|
      puts "#{owner.name} has adopted the following pets:"
      pets_arr.each { |pet| puts pet }
      puts ""
    end
  end

  private

  attr_accessor :adoption_ledger
end

class Pet
  attr_reader :type, :name
  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end

end

class Owner
  attr_reader :name
  attr_accessor :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

=begin
  make a Shelter class/object
    shelter will be a ledger of all adoptions
    printing will occur in the shelter class

    shelters methods:
      should contain a hash as an adoption ledger
      adopt
        adopt should increment the number of pets of the owner who they adopted (setter method), as well as the name of owner and pet (hash, with array as values?)
      print adoptions
        iterate through each owner in the database hash,

  Make an Owner class
    contains the name
    contains the number of pets

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.

=end