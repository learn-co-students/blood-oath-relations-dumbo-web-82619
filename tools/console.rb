require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

blood = Cult.new("Blood Cult", "Blood Valley", 1996, "In blood we shall thrive!!!")
avenger = Cult.new("Avengers", "Marvel Studios", 2019, "Anyone see the new Avengers film yet?")
chaos = Cult.new("Chaos Cult", "Pandemonium", 1867, "In disorder, we find peace...")
plasma = Cult.new("Plasma Cult", "Blood Valley", 2000, "Purer than blood, we are the only true thrivers!")

ben = Follower.new("Benjamin", 21, "Just Do It!!!")
dan = Follower.new("Daniel", 27, "Why am I here?")
eddie = Follower.new("Edward", 36, "Everything comes with a price...")
fred = Follower.new("Frederick", 28, "I'm such an idiot...")
al = Follower.new("Alfred", 42, "Why of course Master Bruce")
ted = Follower.new("Theodore", 34, "I've got this!")
liz = Follower.new("Elizabeth", 17, "He told me to do it!")
nick = Follower.new("Nicholas", 24, "Hey beautiful...")
susan = Follower.new("Susan", 32, "Eww!!! Don't touch me!")
lisa = Follower.new("Lisa", 19, "...")
kevin = Follower.new("Kevin", 26, "I know what I'm doing!")


oath1 = BloodOath.new(blood, ben, "2019-05-15")
oath4 = BloodOath.new(blood, dan, "2015-07-02")
oath2 = BloodOath.new(avenger, dan, "2014-11-27")
oath5 = BloodOath.new(avenger, eddie, "2018-04-01")
oath3 = BloodOath.new(chaos, eddie, "2016-06-06")
oath6 = BloodOath.new(chaos, nick, "2018-07-16")
oath7 = BloodOath.new(blood, fred, "2005-02-01")
oath8 = BloodOath.new(avenger, al, "2011-05-23")
oath9 = BloodOath.new(avenger, ted, "1999-04-12")
oath10 = BloodOath.new(avenger, liz, "2001-08-13")
oath11 = BloodOath.new(blood, nick, "2012-12-21")
oath12 = BloodOath.new(chaos, susan, "2000-10-02")
oath13 = BloodOath.new(blood, lisa, "2005-06-17")
oath14 = BloodOath.new(blood, kevin, "2015-03-06")
oath15 = BloodOath.new(blood, fred, "2013-09-14")
oath16 = BloodOath.new(blood, al, "2015-11-30")
oath17 = BloodOath.new(chaos, ted, "2006-04-07")
oath18 = BloodOath.new(chaos, liz, "2003-06-15")
oath19 = BloodOath.new(chaos, nick, "2012-05-14")
oath20 = BloodOath.new(avenger, susan, "2013-06-25")
oath21 = BloodOath.new(plasma, lisa, "2019-07-14")
oath22 = BloodOath.new(blood, eddie, "2019-08-15")
oath23 = BloodOath.new(blood, ben, "2014-05-14")



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
