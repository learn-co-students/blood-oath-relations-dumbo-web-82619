class BloodOath
  attr_reader :follower, :cult, :initiation_date
  @@all = []

  def initialize(cult: cult, follower: follower, initiation_date: initiation_date)
      @cult = cult
      @follower = follower
      @initiation_date = initiation_date
      @@all << self
  end

  def self.all
    @@all
  end
end
