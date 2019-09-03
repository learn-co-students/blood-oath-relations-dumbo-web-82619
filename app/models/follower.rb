class Follower 
    @@all = []
    attr_reader :name, :age, :life_motto
    def initialize(name, age, life_motto)
        @name = name 
        @age = age
        @life_motto = life_motto 
        @@all << self 
        @cults = []
    end

    def cults
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def join_cult(cult)
        BloodOath.new(self, cult, Time.now.strftime('%F'))
    end 

    def self.all 
        @@all 
    end 

    def self.of_a_certain_age(age)
        @@all.select {|follower| follower.age >= age}
    end 

    def my_cults_slogans 
        self.cults.map {|oath| oath.cult.slogan}
    end 

    def self.most_active 
        @@all.max_by {|follower| follower.cults.size}
    end 

    def self.top_ten 
        @@all.max_by(10) {|follower| follower.cults.size}
    end 

end 

# * `Follower#name`
# * returns a `String` that is the follower's name
# * `Follower#age`
# * returns a `Fixnum` that is the age of the follower
# * `Follower#life_motto`
# * returns a `String` that is the follower's life motto
# * `Follower#cults`
# * returns an `Array` of this follower's cults
# * `Follower#join_cult`
# * takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
# * `Follower.all`
# * returns an `Array` of all the followers
# * `Follower.of_a_certain_age`
# * takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older

# * `Follower#my_cults_slogans`
#   * prints out all of the slogans for this follower's cults
# * `Follower.most_active`
#   * returns the `Follower` instance who has joined the most cults
# * `Follower.top_ten`
#   * returns an `Array` of followers; they are the ten most active followers
