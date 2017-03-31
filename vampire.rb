class Vampire
  attr_reader :name
  @@coven = []
  @@night = true

  def self.create(name, age)
    vampire = Vampire.new(name, age)
    @@coven.push(vampire)
    return vampire
  end

  def self.sunrise
    @@coven.each do |vampire|
      unless @in_coffin && @drank_blood_today
        @@coven.delete(vampire)
        puts "#{vampire.name} did not make it"
      end
    end
  end

  def self.sunset

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
