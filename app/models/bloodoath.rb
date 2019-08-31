class BloodOath
    attr_reader :initiation_date, :follower, :cult
    @@all = []

    def initialize(initiation_date, follower, cult)
        @initiation_date = initiation_date
        @follower = follower
        @cult = cult
        # @@all << self
        check_age
    end

    def check_age
        # binding.pry
        if self.follower.age > self.cult.minimum_age
            @@all << self
        else
            puts "#{self.follower.name} is too young to join. Denied."
        end
    end

    def self.first_oath
        # binding.pry
        #sorts by initiation date
        #returns array sorted
        #.first grabs the first instance of bo
        #bo.follower is the instance of the follower
        @@all.sort_by do |bo|
            bo.initiation_date
        end.first.follower
    end

    def self.all
        @@all
    end

end