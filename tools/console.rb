require_relative '../config/environment.rb'
require 'pry'
require 'date'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#cults

hari_rama_mama = Cult.new("Hari Rama Mama", "Portland", 1980, "Krishna Kissin'ya", 20)
dark_lords = Cult.new("Dark Lord Desciples", "Phoenix", 1990, "HE", 20)
cat_power = Cult.new("Divine Feline Worship Society", "Boston", 1975, "The Time Is Meow", 25)
flat_earth = Cult.new("Sub-Terranian Reptilian Deities Annonomous", "Louisville", 1985, "They Will Rise Again", 25)
brotherhood = Cult.new("The Brotherhood", "Portland", 1985, "Red Laces Forever", 30)

#followers

butterfly = Follower.new("Butterfly Boy", 25, "All ONE")
lucy = Follower.new("Lucifer Smith", 35, "Selfishness Supreme")
tabby = Follower.new("Teddy Tabby", 40, "I Love Cats More Than My Life")
koopa = Follower.new("Koopa Man", 27, "The Earth Is Flat!")
sunshine = Follower.new("Perty Gerty", 18, "Love Is The Answer")
judas = Follower.new("Judas the Breaker", 50, "There Is One True God")
gwen = Follower.new("Gwen Humplik", 37, "Furry Angels Unite")
leonard = Follower.new("Lenny Lizard", 24, "Reptilians Unite!")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
