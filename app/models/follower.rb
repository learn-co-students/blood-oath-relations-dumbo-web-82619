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

    def my_cults #helper method
        BloodOath.all.select do |bo|
            bo.follower == self
        end
    end

    def join_cult(cult_instance)
        #set new instance of blood oath
        BloodOath.new(Time.now.strftime("%F"), self, cult_instance)
    end

    def my_cults_slogans
        my_cults.map do |bo|
            bo.cult.slogan
        end
    end

    def self.helper_for_most_active
        hash = {}
        self.all.map do |follower|
            #sets hash key for follower name and set value equal to size of cults array
            if !hash.key?(follower.name)
                hash[follower.name] = follower.my_cults.size
            end
        end
        hash
    end

    def self.most_active
        # helper_for_most_active
        #returns hash key with highest value 
        self.helper_for_most_active.key(helper_for_most_active.values.max)
    end

    def self.top_ten
        #using sort by return array with key and value
        #reverse to sort starting with highest
        #slice to return from highest to 10th only
        self.helper_for_most_active.sort_by do |k,v| 
            v
        end.reverse.slice(0,9)
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