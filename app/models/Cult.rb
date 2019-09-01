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
        if follower.age >= self.minimum_age
        self.followers << follower
        else
            puts "Patience. You're not of age yet to join this organization."
        end
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

    def average_age
        ages = self.followers.map do |follower|
            follower.age
        end
        (ages.sum)/(ages.size)
    end

    def my_followers_mottos
        self.followers.map do |follower|
            follower.life_motto
        end
    end

    def self.least_popular
        self.all.min_by { |cult| cult.followers.length }
    end
    
    def self.most_common_location
        locations = self.all.map do |cult|
            cult.location
        end
        locations.max_by{|location| locations.count(location)} 
    end







end