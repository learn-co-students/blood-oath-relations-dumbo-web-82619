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

    def recruit_follower(follower_instance)
        BloodOath.new(Time.now.strftime("%F"), follower_instance, self) #not done
    end

    def cult_population
        BloodOath.all.select do |bo|
            bo.cult == self 
        end.size
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