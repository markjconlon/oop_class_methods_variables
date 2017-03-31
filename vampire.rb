require 'irb'
class Vampire
  attr_reader :name
  attr_accessor :in_coffin, :drank_blood_today
  @@coven = []
  @@night = true

  def self.create(name, age)
    vampire = Vampire.new(name, age)
    @@coven.push(vampire)
    return vampire
  end

  def self.sunrise
    @@coven.delete_if do |vampire|
      if vampire.dies?
        puts "#{vampire.name}  did not make it"
      end
      vampire.dies?
    end
  end

  def dies?
    !@in_coffin || !@drank_blood_today
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.drank_blood_today = false
      vampire.in_coffin = false
      vampire.hunt
    end
  end

  def self.all
    @@coven
  end

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true               #starting the vampire in coffin waking up no blood yet
    @drank_blood_today = false
  end

  def drink_blood
    @drank_blood_today = true
  end

  def hunt
    drink_blood if rand(5) <= 1      #60 % chance they will be able to feed
  end
end

Vampire.create("Dracula", 1000)
Vampire.create("Edward", 100)
