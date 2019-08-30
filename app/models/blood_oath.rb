class BloodOath

    attr_reader(:cult, :follower, :initiation_date)

    @@all = []

    def initialize(cult, follower, initiation_date)
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

    def self.initiation_dates
        self.all.map do |oath|
            oath.initiation_date
        end
    end

    def self.first_oath
        self.initiation_dates.min
    end










end

