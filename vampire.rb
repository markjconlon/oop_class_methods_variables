class Vampire
  @@coven = []

  def self.create(name, age)
    vampire = Vampire.new(name, age)
    @@coven.push(vampire)
    return vampire
  end

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true              #starting the vampire in coffin waking up no blood yet
    @drank_blood_today = false
  end


end
