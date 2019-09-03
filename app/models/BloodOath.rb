class BloodOath

    attr_reader :cult, :follower, :initiation_date
    @@all = []

    def initialize(cult, follower)
        @cult = cult
        @follower = follower
        @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @@all << self
    end

    def self.all
        @@all
    end

    # Returns the `Follower` instance for the follower that made the very first blood oath
    def self.first_oath
        sorted_all_blood_oaths = self.all.sort_by do |blood_oath|
            blood_oath.initiation_date
        end
        sorted_all_blood_oaths[0].follower
    end

end