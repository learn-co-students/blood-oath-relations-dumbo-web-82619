require 'date'

class Cult

    attr_reader :founding_year
    attr_accessor :name, :location, :slogan
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name.to_s
        @location = location.to_s
        @founding_year = founding_year.to_i
        @slogan = slogan.to_s
        @followers = []
        @minimum_age = 18

        @@all << self
    end

    def name 
        @name
    end

    def location 
        @location
    end

    def founding_year
        @founding_year
    end

    def slogan
        @slogan
    end

    def followers
        oaths = BloodOath.all.select{|oath| oath.cult == self}
        our_followers = oaths.map{|oath| oath.follower}
        our_followers
    end

    def recruit_follower(follower)
        if follower.age < self.minimum_age
            "You are too young to join this cult"
        else
            BloodOath.new(self, follower)
        end 
    end

    def cult_population
        self.followers.length
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.find{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        @@all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        @@all.select{|cult| cult.founding_year == year}
    end

    def average_age
        total_age = 0
        self.followers.each{|follower| total_age += follower.age}
        count = self.followers.length
        average = total_age / count
    end

    def my_followers_mottos
        followers.each{|follower| puts follower.life_motto}
    end

    def self.least_popular
        min = @@all.map{|cult| cult.followers.length}.min
        @@all.select{|cult| cult.followers.length == min}
    end

    def self.most_common_location
        locations = @@all.map{|cult| cult.location}
        locations.max_by{|i| locations.count(i)}
    end

    def minimum_age
        @minimum_age
    end

end

