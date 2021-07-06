class Bloodoath
  attr_accessor :cult, :follower
  attr_reader :initiation_date
  @@all = []

  def initialize(cult, follower)
    @cult = cult
    @follower = follower
    @initiation_date = Time.now.strftime("%Y-%m-%d")
    cult.followers << follower
    follower.cults << cult
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    self.first.follower
  end

end