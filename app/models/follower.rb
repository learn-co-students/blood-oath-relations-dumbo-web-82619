class Follower
    attr_reader :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def cults
        #return array of instance's cults
        bloodOaths = BloodOath.all.select do |bo|
            bo.follower == self
        end
        bloodOaths.map do |bo|
            bo.cult
        end 
    end

    def join_cult(cult_instance)
        #set new instance of blood oath
        BloodOath.new(Time.now.strftime("%F"), self, cult_instance)
    end

    def self.of_a_certain_age(age)
        #return instance whose older or equal to given age
        @@all.select do |follower|
            follower.age > age
        end
    end

    def self.all
        @@all
    end
end