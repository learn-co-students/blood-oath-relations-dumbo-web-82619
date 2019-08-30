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

  def self.first_oath
    earliest_oath = self.all.first
    date = earliest_oath.initiation_date
    self.all.each do |oath|
      new_date = oath.initiation_date
      if new_date < date
        earliest_oath = oath
        date = new_date
      end
    end
    # puts earliest_oath.initiation_date
    earliest_oath.follower
  end

  def self.all_initiation_dates
    self.all.map do |oath|
      oath.initiation_date
    end.sort!
  end
end
