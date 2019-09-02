class Cult
  attr_reader :name, :location, :founding_year, :min_age
  attr_accessor :slogan, :followers
  @@all = []

  def initialize(name, location, founding_year, slogan, min_age)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @min_age = min_age
    @followers = []
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower)
    if follower.age >= min_age
      Bloodoath.new(self, follower)
    else
      "Sorry, you are not old enough to join #{self.name}"
    end
  end

  def cult_population
    self.followers.count
  end

  def self.find_by_name(name)
    Cult.all.find do |cult|
      cult.name == name
    end
  end

  def self.find_by_location(location)
    Cult.all.select do |cult|
      cult.location == location
    end
  end

  def self.find_by_founding_year(year)
    Cult.all.select do |cult|
      cult.founding_year == year
    end
  end

  def average_age
    ages = self.followers.map {|follower| follower.age}
    ages.reduce(:+).to_f / ages.count
  end

  def my_followers_mottos
    self.followers.map do |follower|
      follower.life_motto
    end
  end

  def self.least_popular
    Cult.all.reduce do |memo, cult|
      memo.followers.count < cult.followers.count ? memo : cult
    end
  end

  def self.most_common_location
    locations = Cult.all.map {|cult| cult.location}
    locations.max_by do |location| 
      locations.count(location)
    end
  end

end