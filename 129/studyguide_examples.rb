class Person
	def initialize(name)
    @name = name
  end
end

class DnDGame
  attr_reader :dungeon_master
  
  def initialize(dm)
    @dungeon_master = (dm)
  end
end

dave = Person.new('Dave')

game = DnDGame.new(dave)

p game.dungeon_master