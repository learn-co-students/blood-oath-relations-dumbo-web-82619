class BloodOath
    attr_accessor :initiation_date, :follower, :cult

    @@all = []
    
    def initialize(follower, cult)
        @initiation_date = "2019-08-26"
        @follower = follower
        @cult = cult
        @@all << self
    end

    def self.all
        @@all 
    end
end


