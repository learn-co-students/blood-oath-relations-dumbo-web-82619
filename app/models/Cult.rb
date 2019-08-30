class Cult
    attr_reader :name, :location, :founding_year, :slogan
    @@all = []

    def initialize(name: name, location: location, founding_year: founding_year, slogan: slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
      @@all
    end

    def blood_oaths
      BloodOath.all.filter do |oath|
        oath.cult == self
      end
    end

    def followers
      self.blood_oaths.map do |oath|
        oath.follower
      end
    end

    def cult_population
      self.blood_oaths.length
    end

    def recruit_follower(follower)
        BloodOath.new({ cult: self, follower: follower })
    end

    def self.find_by_name(name)
      Cult.all.find do |cult|
        cult.name == name
      end
    end

    def self.find_by_location(location)
      Cult.all.filter do |cult|
        cult.location == location
      end
    end

    def self.find_by_founding_year(year)
      Cult.all.filter do |cult|
        cult.founding_year == year
      end
    end

    def average_age
      # fix to float
      self.followers.map do |follower|
        follower.age
      end
      .inject(0, :+) / self.cult_population
    end

end
