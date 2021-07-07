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
    
    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(self, follower)   
        else 
            puts "Sorry! The minimum age to join this cult is: #{cult.minimum_age}."
        end 
    end 
    
    # helper: current oaths this follower involved with
    def cur_oaths
        BloodOath.all.select {|bloodoath| bloodoath.follower == self}
    end 

    # helper: current cults this follower joined 
    def cults
        self.cur_oaths.map {|bloodoath| bloodoath.cult}
    end 

    # helper: how many cults this follower joined
    def cults_amount
        self.cults.size
    end 
    
    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age == age}
    end 

    def my_cults_slogans
        self.cults.map {|cult| cult.slogan}
    end 

    def self.most_active
        Follower.all.max_by {|follower| follower.cults_amount}
    end 

    def self.top_ten
        tops = Follower.all.sort_by {|follower| follower.cults_amount}
        tops.reverse.slice(0,10)
    end 

    def fellow_cult_members
        cults_member = self.cults.map {|cult| cult.cur_followers}.flatten

        new_cults_member = cults_member.select { |follower| cults_member.count(follower) > 1}

        new_cults_member.uniq!
        new_cults_member.delete_if {|follower| follower == self}
    end






end
