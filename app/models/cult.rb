class Cult 
    @@all = []
    attr_reader :name, :location, :founding_year, :slogan 
    def initialize(name, location, founding_year, slogan)
        @name = name 
        @location = location 
        @founding_year = founding_year 
        @slogan = slogan 
        @@all << self 
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self, Time.now.strftime('%F'))
    end 

    def cult_list 
        BloodOath.all.select {|oath| oath.cult == self}
    end

    def cult_population 
        cult_list.size 
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_name(name)
        @@all.find {|cult| cult.name == name}
    end 

    def self.find_by_location(location)
        @@all.find {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        @@all.find {|cult| cult.founding_year == year}
    end 

    def average_age 
        age_arr = cult_list.map {|oath| oath.follower.age}
        age_arr.inject{ |sum, age| sum + age }.to_f / age_arr.size
    end 

    def my_followers_mottos 
        mottos = cult_list.map {|oath| oath.follower.life_motto}
        puts mottos
    end 

    def self.least_popular 
        @@all.min_by {|cult| cult.cult_population}
    end 

    def self.most_common_location 
        loc_arr = @@all.map {|cult| cult.location}
        loc_arr.max_by { |i| loc_arr.count(i) }
    end 

end 


# * `Cult#name`
# * returns a `String` that is the cult's name
# * `Cult#location`
# * returns a `String` that is the city where the cult is located
# * `Cult#founding_year`
# * returns a `Fixnum` that is the year the cult was founded
# * `Cult#slogan`
# * returns a `String` that is this cult's slogan
# * `Cult#recruit_follower`
# * takes in an argument of a `Follower` instance and adds them to this cult's list of followers
# * `Cult#cult_population`
# * returns a `Fixnum` that is the number of followers in this cult
# * `Cult.all`
# * returns an `Array` of all the cults
# * `Cult.find_by_name`
# * takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
# * `Cult.find_by_location`
# * takes a `String` argument that is a location and returns an `Array` of cults that are in that location
# * `Cult.find_by_founding_year`
# * takes a `Fixnum` argument that is a year and returns all of the cults founded in that year


# * `Cult#average_age`
#   * returns a `Float` that is the average age of this cult's followers
# * `Cult#my_followers_mottos`
#   * prints out all of the mottos for this cult's followers
# * `Cult.least_popular`
#   * returns the `Cult` instance who has the least number of followers :(
# * `Cult.most_common_location`
#   * returns a `String` that is the location with the most cults
