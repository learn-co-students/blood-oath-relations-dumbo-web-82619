class BloodOath

    attr_reader :cult, :follower, :initiation_date
    @@all = []

    # format _YYYY-MM-DD_
    def initialize(cult, follower)
        @cult = cult 
        @follower = follower 
        @initiation_date = Time.now.strftime('%F')
        @@all << self
    end 

    def self.all
        @@all
    end 

    def self.first_oath
        BloodOath.all.min_by {|oath| oath.initiation_date}
    end
    

    

end
