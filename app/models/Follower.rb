class Follower

    attr_reader :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    # Helper method returns the blood oaths of this Follower instance
    def blood_oaths
        BloodOath.all.select do |blood_oath|
            blood_oath.follower == self
        end
    end

    # Returns an `Array` of this follower's cults
    def cults
        self.blood_oaths.map do |blood_oath|
            blood_oath.cult
        end
    end

    # Takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    # Takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older
    def self.of_a_certain_aFge(age)
        @@all.select do |follower|
            follower.age == age
        end
    end

    

end