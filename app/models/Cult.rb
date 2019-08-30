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
      self.followers.map do |follower|
        follower.age
      end
      .inject(0, :+) / self.cult_population.to_f
    end

    def my_followers_mottos
      self.followers.each do |follower|
        follower.life_motto
        puts follower.life_motto
      end
    end

    def self.least_popular
      least_popular_cult = self.all.first
      amount = least_popular_cult.cult_population
      self.all.each do |cult|
        new_amount = cult.cult_population
        if new_amount < amount
          least_popular_cult = cult
          amount = new_amount
        end
      end
      return least_popular_cult
    end

    def self.most_common_location
      new_hash = self.all.each_with_object(Hash.new(0)) do |cult, hash|
        hash[cult.location] += 1
      end
      new_hash.max_by(&:last).first
    end
end
