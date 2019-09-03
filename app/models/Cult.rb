class Cult

    attr_reader :name, :location, :founding_year, :slogan, :minimum_age
    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def self.all
        @@all
    end

    # Takes in an argument of a `Follower` instance and adds them to this cult's list of followers
    # NOW this is changed such that if the given `Follower` instance is not of age:
    #   do not let them join the cult
    #   print out a friendly message informing them that they are too young
    def recruit_follower(follower)
        if follower.age < self.minimum_age
            "Sorry, you do not meet the minimum age requirement."
        else
            BloodOath.new(self, follower)
            "Welcome to the cult! (There is no turning back now muhahaha)."
        end
    end

    # Helper method to return the blood oaths of this Cult instance (aka the followers of this Cult instance)
    def blood_oaths
        BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
    end

    # Returns a `Fixnum` that is the number of followers in this cult
    def cult_population
        self.blood_oaths.count
    end

    # Takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
    def self.find_by_name(name)
        @@all.find do |cult|
            cult.name == name
        end
    end

    # Takes a `String` argument that is a location and returns an `Array` of cults that are in that location
    def self.find_by_location(location)
        @@all.select do |cult|
            cult.location == location
        end
    end

    # Takes a `Fixnum` argument that is a year and returns all of the cults founded in that year
    def self.find_by_founding_year(year)
        @@all.select do |cult|
            cult.founding_year == year
        end
    end

    # Returns a `Float` that is the average age of this cult's followers
    def average_age
        followers_ages = self.blood_oaths.map do |blood_oath|
            blood_oath.follower.age
        end
        followers_ages.reduce(:+)/followers_ages.size
    end

    # Prints out all of the mottos for this cult's followers
    def my_followers_mottos
        self.blood_oaths.map do |blood_oath|
            blood_oath.follower.life_motto
        end
    end

    # Returns an array of all 'Cult' instances sorted by their population (largest population -> smallest population)
    def self.cult_population_sort
        all_cults_population = self.all.map do |cult|
            {cult => cult.cult_population}
        end
        sorted_all_cults_population = all_cults_population.sort_by do |cult|
            cult.values[0]
        end
        sorted_all_cults_population.reverse
    end

    # Returns the `Cult` instance who has the least number of followers
    def self.least_popular
        self.cult_population_sort[0].keys
    end

    # Returns a `String` that is the location with the most cults
    def self.most_common_location
        all_locations = {}
        @@all.select do |cult|
            if all_locations.key?(cult.location)
               all_locations[cult.location] += 1
            else
                all_locations[cult.location] = 1 
            end
        end
        all_locations.min[0]
    end

end