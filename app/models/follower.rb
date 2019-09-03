require 'date'

class Follower

    attr_reader :age
    attr_accessor :name, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name.to_s
        @age = age.to_i
        @life_motto = life_motto.to_s

        @@all << self
    end

    def name 
        @name
    end

    def age
        @age
    end

    def life_motto
        @life_motto
    end

    def cults
        oaths = BloodOath.all.select do |oath|
            oath.follower == self
        end
        cults = oaths.map{|oath| oath.cult}
    end

    def join_cult(cult)
        if @age < cult.minimum_age
            "You are too young to join this cult"
        else
            BloodOath.new(cult, self)
        end
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        at_least = @@all.select{|follower| follower.age >= age}
        at_least
    end

    def my_cults_slogans
        self.cults.each{|cult| puts cult.slogan}
    end

    def self.most_active
        @@all.max_by{|follower| follower.cults.length}
    end

    def self.top_ten
        @@all.max_by(10){|follower| follower.cults.length}
    end

    def fellow_cult_members
        cults_im_in = self.cults
        all_followers = Follower.all
        fellows = []
        all_followers.each do |follower|
            if ((follower.cults & cults_im_in).length > 0)
                fellows << follower 
            end
        end
        fellows - [self]
    end

end