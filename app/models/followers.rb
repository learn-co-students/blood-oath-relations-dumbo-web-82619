class Follower
  attr_reader :name, :age
  attr_accessor :life_motto, :cults
  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @cults = []
    @@all << self
  end

  def self.all
    @@all
  end

  def join_cult(cult)
    if self.age >= cult.min_age
      Bloodoath.new(cult, self)
    else
      "Sorry, you are not old enough to join #{cult.name}"
    end
  end

  def self.of_a_certain_age(age)
    Follower.all.select do |follower|
      follower.age >= age
    end
  end

  def my_cults_slogans
    self.cults.each do |cult|
      puts cult.slogan
    end
  end

  def self.most_active
    Follower.all.reduce do |memo, follower|
      memo.cults.count > follower.cults.count ? memo : follower
    end
  end

  def self.top_ten
    ranked_followers = Follower.all.sort_by {|follower| follower.cults.count}
    ranked_followers.reverse.take(10)
  end

  def fellow_cult_members
    follower_list = self.cults.map {|cult| cult.followers}
    follower_list.flatten.uniq.delete_if {|element| element == self}
  end

end