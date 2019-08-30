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
    if self.age < cult.minimum_age
      puts "We're terribly sorry, but we at #{cult.name} have a minimum age requirement of #{cult.minimum_age}. Please consider joining us in #{cult.minimum_age - self.age} year(s). Thank you for understanding!"
    else
      BloodOath.new(cult: cult, follower: self, initiation_date: Time.now.strftime("%Y-%m-%d"))
    end
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

  def fellow_cult_members
    array = self.cults.map do |cult|
      cult.followers
    end
    array.flatten!.uniq!

    array.filter do |follower|
      follower != self
    end
  end
end
