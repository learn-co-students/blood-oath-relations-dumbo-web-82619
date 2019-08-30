require_relative '../config/environment.rb'
require 'time'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

def random_date
  Time.at(rand * Time.now.to_i).strftime("%Y-%m-%d")
end

def random_year
  Time.at(rand * Time.now.to_i).year
end

cult_hash = {
  name: "The Cult of Cults",
  location: "Everywhere",
  founding_year: random_year,
  slogan: "We are all.",
  minimum_age: 18
}

octopus_hash = {
  name: "Cult of Octopus",
  location: "Under the Sea",
  founding_year: 2019,
  slogan: "We love Octopus!",
  minimum_age: 18
}

current_hash = {
  name: "Cult of 2019",
  location: "Elsewhere",
  founding_year: random_year,
  slogan: "Stay current!",
  minimum_age: 18
}

squid_hash = {
  name: "Cult of Squid",
  location: "Under the Sea",
  founding_year: random_year,
  slogan: "We love Squid!",
  minimum_age: 18
}

coin_hash = {
  name: "Cult of Coins",
  location: "Mushroom Kingdom",
  founding_year: 1985,
  slogan: "Let's-a-go!",
  minimum_age: 18
}

triforce_hash = {
  name: "Cult of the Triforce",
  location: "Hyrule",
  founding_year: 1986,
  slogan: "It's dangerous to go alone! Take this.",
  minimum_age: 18
}

seiros_hash = {
  name: "Church of Seiros",
  location: "Fodlan",
  founding_year: random_year,
  slogan: "All I ask is that you guide these open minds with virtue, care, and sincerity.",
  minimum_age: 18
}

deer_hash = {
  name: "Golden Deer",
  location: "Fodlan",
  founding_year: random_year,
  slogan: "Fear the Deer!",
  minimum_age: 18
}

lion_hash = {
  name: "Blue Lions",
  location: "Fodlan",
  founding_year: random_year,
  slogan: "For Justice!",
  minimum_age: 18
}

eagle_hash = {
  name: "Black Eagles",
  location: "Fodlan",
  founding_year: random_year,
  slogan: "Hail Emperor Edelgard!",
  minimum_age: 18
}

cult = Cult.new(cult_hash)
octopus = Cult.new(octopus_hash)
current = Cult.new(current_hash)
squid = Cult.new(squid_hash)
coin = Cult.new(coin_hash)
triforce = Cult.new(triforce_hash)
seiros = Cult.new(seiros_hash)
deer = Cult.new(deer_hash)
lion = Cult.new(lion_hash)
eagle = Cult.new(eagle_hash)

alexi_hash = {
  name: "Alexi",
  age: 55,
  life_motto: "Be the octopus!"
}

sasha_hash = {
  name: "Sasha",
  age: 34,
  life_motto: "Keep an open mind."
}

robin_hash = {
  name: "Robin",
  age: 21,
  life_motto: "Keep an open heart."
}

morgan_hash = {
  name: "Morgan",
  age: 15,
  life_motto: "Always stay mindful."
}

dimitri_hash = {
  name: "Dimitri",
  age: 22,
  life_motto: "Someone must put a stop to this cycle of the strong trampling the weak."
}

edelgard_hash = {
  name: "Edelgard",
  age: 22,
  life_motto: "Crests are to blame for this brutal, irrational world we live in."
}

claude_hash = {
  name: "Claude",
  age: 22,
  life_motto: "We have the strength to scale the walls between us, to reach out our hands in friendship so we can open our true hearts to one another."
}

mario_hash = {
  name: "Mario",
  age: 34,
  life_motto: "It's-a-me, Mario!"
}

link_hash = {
  name: "Link",
  age: 33,
  life_motto: "..."
}

zelda_hash = {
  name: "Zelda",
  age: 33,
  life_motto: "Open your eyes..."
}

gaster_hash = {
  name: "",
  age: 0,
  life_motto: ""
}

sasha = Follower.new(sasha_hash)
alexi = Follower.new(alexi_hash)
robin = Follower.new(robin_hash)
morgan = Follower.new(morgan_hash)
dimitri = Follower.new(dimitri_hash)
edelgard = Follower.new(edelgard_hash)
claude = Follower.new(claude_hash)
mario = Follower.new(mario_hash)
link = Follower.new(link_hash)
zelda = Follower.new(zelda_hash)
gaster = Follower.new(gaster_hash)

#Cult 1
BloodOath.new(cult: cult, follower: alexi, initiation_date: random_date)
BloodOath.new(cult: cult, follower: sasha, initiation_date: random_date)
BloodOath.new(cult: cult, follower: robin, initiation_date: random_date)

#Cult 2 Octopus
BloodOath.new(cult: octopus, follower: alexi, initiation_date: random_date)
BloodOath.new(cult: octopus, follower: sasha, initiation_date: random_date)
BloodOath.new(cult: octopus, follower: morgan, initiation_date: random_date)

#Cult 3
BloodOath.new(cult: current, follower: alexi, initiation_date: random_date)

#Cult 4 Squid
BloodOath.new(cult: squid, follower: alexi, initiation_date: random_date)

#Cult 5 Coin
BloodOath.new(cult: coin, follower: alexi, initiation_date: random_date)
BloodOath.new(cult: coin, follower: mario, initiation_date: random_date)

#Cult 6 Triforce
BloodOath.new(cult: triforce, follower: alexi, initiation_date: random_date)
BloodOath.new(cult: triforce, follower: zelda, initiation_date: random_date)
BloodOath.new(cult: triforce, follower: link, initiation_date: random_date)

#Cult 7 Seiros
BloodOath.new(cult: seiros, follower: alexi, initiation_date: random_date)

#Cult 8 Deer
BloodOath.new(cult: deer, follower: alexi, initiation_date: random_date)
BloodOath.new(cult: deer, follower: claude, initiation_date: random_date)

#Cult 9 Lion
BloodOath.new(cult: lion, follower: alexi, initiation_date: random_date)
BloodOath.new(cult: lion, follower: dimitri, initiation_date: random_date)

#Cult 10 Eagle
BloodOath.new(cult: eagle, follower: alexi, initiation_date: random_date)
BloodOath.new(cult: eagle, follower: edelgard, initiation_date: random_date)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
