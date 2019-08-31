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

    def cults
        my_cults = BloodOath.all.select do |blood_oath|
            blood_oath.follower == self
        end
        my_cults.map do |blood_oath|
            blood_oath.cult
        end
    end

    def join_cult(cult)
        cult.followers << self
    end

    def self.of_a_certain_age(num)
        self.all.select do |follower|
            follower.age >= num
        end
    end










end