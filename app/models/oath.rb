class BloodOath 
    @@all = []
    attr_reader :follower, :cult, :date
    def initialize(follower, cult, date)
        @follower = follower 
        @cult = cult 
        @date = date 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.first_oath 
        @@all.first
    end 

end

# * `BloodOath#initiation_date`
#   * returns a `String` that is the initiation date of this blood oath in the format _YYYY-MM-DD_.
# * `BloodOath.all`
#   * returns an `Array` of all the blood oaths


#   * `BloodOath.first_oath`
#   * returns the `Follower` instance for the follower that made the very first blood oath
