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

  def oaths
    BloodOath.all.filter do |oath|
      oath.follower == self
    end
  end

  def cults
    self.oaths.map do |oath|
      oath.cult
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

  def my_cults_slogans
    self.cults.each do |cult|
      puts cult.slogan
    end
  end

  def self.most_active
    most_active = self.all.first
    amount = 0
    self.all.each do |follower|
      new_amount = follower.oaths.length
      if new_amount > amount
        most_active = follower
        amount = new_amount
      end
    end
    most_active
  end

  def self.top_ten
    array = self.all.sort_by do |follower|
      -follower.oaths.length
    end
    array[0..9]
  end
end
