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

    def my_blood_oaths
        BloodOath.all.select do |bloodoath|
          bloodoath.cult == self
        end
      end
    
      def followers
        my_blood_oaths.map do |bloodoath|
          bloodoath.follower
        end
      end

    def recruit_follower(follower)
        followers << follower
    end

    def cult_population
        pop = BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
        pop.size
    end
    
    def Cult.find_by_name(name)
        self.all.select do |cult|
            cult.name == name
        end
    end

    def Cult.find_by_location(location)
        self.all.select do |cult|
            cult.location == location
        end
    end

    def Cult.find_by_founding_year(founding_year)
        self.all.select do |cult|
            cult.founding_year == founding_year
        end
    end







end