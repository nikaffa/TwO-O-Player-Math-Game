#Player Class

class Player

  attr_accessor :name
  attr_accessor :life

  def initialize name
    @name = name
    @life = 3
  end

  def lose_a_life
    @life -= 1
  end

end
