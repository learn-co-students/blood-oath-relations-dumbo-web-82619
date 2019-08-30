class Follower
  attr_reader :name, :age, :life_motto
  @@all = []

  def initialize(name: name, age: age, life_motto: life_motto)
      @name = name
      @age = age
      @life_motto = life_motto
      @@all << self
  end

  def self.all
    @@all
  end

  def cults
    BloodOath.all.filter do |oath|
      oath.follower == self
    end
  end

  def join_cult(cult)
    BloodOath.new(cult: cult, follower: self, initiation_date: "2019-08-30")
  end

  def self.of_a_certain_age(age)
    self.all.filter do |follower|
      follower.age >= age
    end
  end

end
