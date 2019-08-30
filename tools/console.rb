require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1_hash = {
  name: "The Cult of Cults",
  location: "Everywhere",
  founding_year: 1812,
  slogan: "We are all."
}

cult2_hash = {
  name: "Cult of Octopus",
  location: "Under the Sea",
  founding_year: 2019,
  slogan: "We love Octopus!"
}

cult3_hash = {
  name: "Cult of 2019",
  location: "Elsewhere",
  founding_year: 2019,
  slogan: "Stay current!"
}

cult4_hash = {
  name: "Cult of Squid",
  location: "Under the Sea",
  founding_year: 2007,
  slogan: "We love Squid!"
}

cult1 = Cult.new(cult1_hash)
cult2 = Cult.new(cult2_hash)
cult3 = Cult.new(cult3_hash)
cult4 = Cult.new(cult4_hash)

foll1_hash = {
  name: "Alexi",
  age: 55,
  life_motto: "Be the octopus!"
}

foll2_hash = {
  name: "Sasha",
  age: 34,
  life_motto: "Keep an open mind."
}

foll3_hash = {
  name: "Robin",
  age: 21,
  life_motto: "Keep an open heart."
}

foll4_hash = {
  name: "Morgan",
  age: 48,
  life_motto: "Always stay mindful."
}

foll1 = Follower.new(foll1_hash)
foll2 = Follower.new(foll2_hash)
foll3 = Follower.new(foll3_hash)
foll4 = Follower.new(foll4_hash)

BloodOath.new(cult: cult1, follower: foll1, initiation_date: "2000-08-20")
BloodOath.new(cult: cult1, follower: foll2, initiation_date: "2019-08-30")
BloodOath.new(cult: cult1, follower: foll3, initiation_date: "1990-03-04")

BloodOath.new(cult: cult2, follower: foll1, initiation_date: "2019-08-20")
BloodOath.new(cult: cult2, follower: foll2, initiation_date: "2019-08-20")
BloodOath.new(cult: cult2, follower: foll4, initiation_date: "2019-08-20")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
