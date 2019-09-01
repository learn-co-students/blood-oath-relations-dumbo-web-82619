class BloodOath
    attr_accessor :initiation_date, :follower, :cult

    @@all = []
    
    def initialize(follower, cult)
        @initiation_date = Time.now.strftime("%Y/%m/%d")
        @follower = follower
        @cult = cult
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.first_oath
        oaths = self.all.sort_by {|blood_oath| blood_oath.initiation_date}
        oaths[0].follower
      end
end

