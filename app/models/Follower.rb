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

    def my_cults_slogans
        cults.map do |cult|
            cult.slogan
        end
    end

    def self.most_active
        active_followers = BloodOath.all.map do |blood_oath|
            blood_oath.follower
        end
        active_followers.max_by{|follower| active_followers.count(follower)} 
    end

    def self.top_ten
        active_followers = BloodOath.all.map do |blood_oath|
            blood_oath.follower
        end
        top_ten = active_followers.map do |follower|
            {follower => follower.cults.length}
        end
         top_ten_final = top_ten.sort_by {|follower| follower.values[0]}
         top_ten_final.reverse
    end

    def fellow_cult_members
        my_homies = self.cults.map do |cult|
            cult.followers 
        end
        my_homies.uniq
    end

            

        














end