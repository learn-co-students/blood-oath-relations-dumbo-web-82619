class Follower

    attr_reader(:name, :age, :life_motto)

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
        oaths = BloodOath.all.select do |oath|
            oath.follower == self
        end
        cults_followed = oaths.map do |oath|
            oath.cult 
        end
        cults_followed
    end

    def join_cult(cult)
        if self.age < cult.minimum_age
            "Sorry, you are to young to join this cult"
        else
            BloodOath.new(cult, self, Time.now.strftime("%Y-%m-%d"))
            "#{self.name} has joined the #{cult.name}"
        end
    end

    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age >= age
        end
    end

    def my_cult_slogans
        slogans = self.cults.map do |cult|
            cult.slogan 
        end
        print slogans
    end

    def cults_joined
        self.cults.size
    end

    def self.following
        joined_cults = self.all.map do |follower|
            follower.cults_joined
        end
    end

    def self.most_active
        self.all.select do |follower|
            follower.cults_joined == self.following.max
        end
    end

    def self.top_ten
        sorted = self.all.sort_by do |follower|
            follower.cults_joined
        end
        name_list = sorted.map do |follower|
            follower.name
        end
        name_list.last(10)
    end

    def fellow_cult_members
        follower_list = []
        followers = self.cults.map do |cult|
            cult.followers.each do |follower|
                follower_list << follower
            end
        end
        uniq_list = follower_list.uniq
        uniq_list.delete(self)
        uniq_list.map do |follower|
            follower.name
        end
    end 
end