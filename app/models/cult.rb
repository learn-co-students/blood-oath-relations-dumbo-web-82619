class Cult

    attr_reader :name, :location, :founding_year, :slogan, :minimum_age
    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age = 16)
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
    
    def recruit_follower(follower)
        if follower.age >= self.minimum_age
            BloodOath.new(self, follower)   
        else 
            puts "Sorry! The minimum age to join this cult is: #{self.minimum_age}."
        end 
    end 

    # helper: current oaths this cult involved with
    def cur_oaths
        BloodOath.all.select {|bloodoath| bloodoath.cult == self}
    end 

    # helper: current followers this cult has
    def cur_followers
        self.cur_oaths.map {|bloodoath| bloodoath.follower}
    end 

    def cult_population
        self.cur_followers.size
    end 

    def self.find_by_name(name)
        Cult.all.find {|cult| cult.name == name}
    end 

    def self.find_by_location(location)
        Cult.all.select {|cult| cult.location == location}
    end 

    def self.find_by_founding_year(year_num)
        Cult.all.select {|cult| cult.founding_year == year_num}
    end 

    def average_age
        all_ages = self.cur_followers.map {|follower| follower.age }
        average = all_ages.sum / all_ages.size.to_f
    end 

    def my_followers_mottos
        self.cur_followers.map {|follower| follower.life_motto}
    end 

    def self.least_popular
        Cult.all.min_by {|cult| cult.cult_population}
    end 

    # helper: arr of all locations, no duplicate
    def self.all_locations
        all_locations = Cult.all.map {|cult| cult.location}
        all_locations.uniq
    end 

    #[ [c1(l1), c2(l1)], [c3(l2)], [c4(l3)] ]
    def self.most_common_location
        cults_of_diff_locations = Cult.all_locations.map do |location| 
            Cult.find_by_location(location)
        end

        cults_of_the_location = cults_of_diff_locations.max_by {|element| element.size}

        cults_of_the_location[0].location
    end 


end 