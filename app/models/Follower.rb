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

    # Returns an `Array` of this follower's cults
    def cults
        blood_oaths = BloodOath.all.select do |blood_oath|
            blood_oath.follower == self
        end
        blood_oaths.map do |blood_oath|
            blood_oath.cult
        end
    end

    # Takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
    # NOW this is changed such that if you don't meet the minimum age requirement of the given `Cult` instance:
    #   do not let them join the cult
    #   print out a friendly message informing them that they are too young
    def join_cult(cult)
        if self.age < cult.minimum_age
            "Sorry, you do not meet the minimum age requirement."
        else
            BloodOath.new(cult, self)
            "Welcome to the cult! (There is no turning back now muhahaha)."
        end
    end

    # Takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older
    def self.of_a_certain_aFge(age)
        @@all.select do |follower|
            follower.age == age
        end
    end

    # Prints out all of the slogans for this follower's cults
    def my_cults_slogans
        all_my_cults_slogans = self.cults.map do |cult|
            cult.slogan
        end
        puts all_my_cults_slogans.uniq
    end

    # Returns the sorted array of all 'Follower' instances by their activity count (most active -> least active)
    def self.follower_activity_sort
        all_followers_cult_count = @@all.map do |follower|
            {follower => follower.cults.count}
        end
        sorted_all_followers_cult_count = all_followers_cult_count.sort_by do |follower|
            follower.values[0]
        end
        sorted_all_followers_cult_count.reverse
    end

    # Returns the `Follower` instance who has joined the most cults
    def self.most_active
        self.follower_activity_sort[0]
    end

    # Returns an `Array` of followers; they are the ten most active followers
    def self.top_ten
        self.follower_activity_sort[0..9]
    end

    # Returns a unique `Array` of followers who are in the same cults as you

    # You have all the 'Follower' instances and select the 'Follower' instances that are in the sets of all the cults of each 'Follower' instance and this 'Follower' instance and where the 'Follower' instance is not this 'Follower' instance
    def fellow_cult_members
        Follower.all.select do |follower|
            follower.cults & self.cults != [] && follower != self
        end
    end

end