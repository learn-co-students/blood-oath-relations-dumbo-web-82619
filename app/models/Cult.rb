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

    def self.all
        @@all
    end

    # Takes in an argument of a `Follower` instance and adds them to this cult's list of followers
    def recruit_follower(follower)
        BloodOath.new(self, follower)
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

end