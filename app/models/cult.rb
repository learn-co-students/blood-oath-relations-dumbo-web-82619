require 'pry'

class Cult

    attr_reader(:name, :location, :founding_year, :slogan)

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def followers
        oaths = BloodOath.all.select do |oath|
            oath.cult == self
        end
        cult_followers = oaths.map do |oath|
            oath.follower
        end
        cult_followers
    end

    def recruit_follower(follower)
        if follower.age < self.minimum_age
            "Sorry, you are too young to join our esteemed cult"
        else
            BloodOath.new(self, follower, Time.now.strftime("%Y-%m-%d"))
            "#{follower.name} has joined the #{self.name}"
        end
    end

    def cult_population
        self.followers.size
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find do |cult|
            cult.name.downcase == name.downcase
        end
    end

    def self.find_by_location(location)
        self.all.select do |cult|
            cult.location.downcase == location.downcase
        end
    end

    def self.find_by_founding_year(year)
        self.all.select do |cult|
            cult.founding_year == year
        end
    end

    def average_age
        ages = self.followers.map do |follower|
            follower.age
        end
        total_age = ages.reduce do |total, age|
            total + age
        end
        average_age = total_age / self.followers.size
        average_age
    end

    def my_follower_mottos
        mottos = self.followers.map do |follower|
            "#{follower.name}: #{follower.life_motto}"
        end
        print mottos
    end

    def self.populations
        self.all.map do |cult|
            cult.cult_population
        end
    end

    def self.least_popular
        self.all.select do |cult|
            cult.cult_population == self.populations.min
        end
    end

    def self.locations
        self.all.map do |cult|
            cult.location
        end
    end

    def self.most_common_location
        self.locations.max_by do |location|
            self.locations.count(location)
        end
    end

    def minimum_age
        min_age = 18
    end

end