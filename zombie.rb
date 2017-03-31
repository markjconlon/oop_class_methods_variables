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

  def encounter
    if self.outrun_zombie?
      puts "Phew that was close."
    elsif self.survive_attack?
      @@horde << Zombie.new()
      puts "You were turned :("
    else
      puts "You were mauled to death"
    end
  end

  def outrun_zombie?
    rand(@@max_speed + 1 ) > @speed #in this instance of zombie can use instance variable
  end

  def survive_attack?
    rand(@@max_strength +1 ) > @strength
  end
end


puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
