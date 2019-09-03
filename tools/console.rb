require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

f1 = Follower.new("Kim", 36, "you're doing amazing sweetie")
f2 = Follower.new("Kourtney", 39, "people are dying")
f3 = Follower.new("Khloe", 37, "*imitates snorting blow*")
f4 = Follower.new("fKris", 195, "momager")
f5 = Follower.new("Kylie", 21, "dr miami")
f6 = Follower.new("Kendall", 24, "over it")
f7 = Follower.new("Kenny", 16, 'mom made me do it')
f8 = Follower.new("Kraig", 62, "here for the kool-aid")
f9 = Follower.new("Krysanthemum", 4, "secret demon")
f10 = Follower.new("Kevin", 81, "no time like the present")
f11 = Follower.new("Kylies_clone", 2, "error: does not compute")

c1 = Cult.new("Hutterites", "Montana", 1736, "Like the Amish but unfriendlier", 30)
c2 = Cult.new("RadFae", "Short Mountain", 1970, "Lesbian separatist but make it fashion", 40)
c3 = Cult.new("Naihsadark", "Montana", 1991, "free lip kits!!", 18)
c4 = Cult.new("Candy Mountain", "Montana", 1890, "Existence is an illusion!", 21)

f1.join_cult(c1)
f1.join_cult(c2)
f1.join_cult(c3)
f2.join_cult(c3)
f3.join_cult(c3)
f4.join_cult(c3)
f5.join_cult(c3)
f6.join_cult(c3)
f7.join_cult(c3)
f8.join_cult(c3)
f9.join_cult(c3)
f10.join_cult(c3)
f11.join_cult(c3)
f11.join_cult(c2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
