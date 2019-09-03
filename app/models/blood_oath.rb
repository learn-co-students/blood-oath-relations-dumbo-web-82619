require 'date'

class BloodOath

    attr_reader :date
    attr_accessor :cult, :follower
    @@all = []

    def initialize(cult, follower)
        @date = Date.today
        @cult = cult
        @follower = follower

        @@all << self
    end

    def initiation_date
        @date
    end

    def self.all
        @@all
    end

    def self.first_oath
        @@all[0]
    end

end