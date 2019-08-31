class Cult
    attr_reader :name, :location, :founding_year, :slogan
    @@all = []
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    def minimum_age
        21
    end

    def recruit_follower(follower_instance)
        BloodOath.new(Time.now.strftime("%F"), follower_instance, self) #not done
    end

    def members #helper method
        BloodOath.all.select do |bo|
            bo.cult == self 
        end
    end

    def members_name
        members.map do |bo|
            bo.follower.name
        end
    end

    def cult_population
        members.size
    end

    def average_age
        total = members.sum do |member|
            member.follower.age
        end

        (total / cult_population).to_f
        # binding.pry
    end

    def my_followers_mottos
        members.map do |member|
            member.follower.life_motto
        end
    end

    def self.least_popular
        self.all.min_by do |cult|
            cult.cult_population
        end
    end

    def self.most_common_location
        hash = {}
        self.all.map do |cult|
            #checks if hash has following cult location. If not, key to location and value to 1
            if !hash.key?(cult.location)
                hash[cult.location] = 1
            else
            #if exists, add value by 1
                hash[cult.location] += 1
            end
        end
        #returns key with highest value
        hash.key(hash.values.max)
    end
    
    def self.find_by_name(string_name)
        #return cult instance matching arg
        self.all.find do |cult|
            cult.name == string_name
        end
    end

    def self.find_by_location(string_location)
        #return array of cults in the location
        self.all.select do |cult|
            cult.location == string_location
        end
    end

    def self.find_by_founding_year(year)
        #return array of matching year
        self.all.select do |cult|
            cult.founding_year == year
        end
    end

    def self.all
        @@all
    end
end