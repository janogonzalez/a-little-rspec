class Ninja
  attr_reader :health, :power
  
  def initialize(health = 10, power = 10)
    @health = health
    @power = power
  end
  
  def super_attack!(ninja)
    if @health > 5
      @health -= 5
      ninja.receive_attack!(@power / 2 + 5)
    else
      attack(ninja)
    end
  end
  
  def attack(ninja)
    ninja.receive_attack!(@power / 2)
  end
  
  def dead?
    @health <= 0
  end
  
  protected
  
  def receive_attack!(power)
    @health -= power
  end
end