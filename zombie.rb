class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def self.all
    return @@horde
  end

  def self.spawn
    rand(@@plague_level).times do
      zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde.push(zombie)
    end
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
    puts "#{@@horde.length} zombies are left and the plague level is #{@@plague_level}"
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end

  def self.some_die_off
    num = rand(11)
    num.times do
      @@horde.delete_at(rand(@@horde.length - 1))
    end
  end

  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end
    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
  end

end


# mark = Zombie.new(3, 3)
# joe = Zombie.new(10,10)
#
# puts mark.inspect
# puts joe.inspect
Zombie.spawn
Zombie.spawn
Zombie.spawn
Zombie.spawn
puts Zombie.all
Zombie.new_day
Zombie.new_day
Zombie.new_day
Zombie.new_day
Zombie.new_day
