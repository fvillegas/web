########## DAZ4126 website ###########
require 'bundler'
Bundler.require

get '/' do
  @title = "DAZ, Made in Manchester"
  slim :index
end

__END__
########### Views ###########

@@index
h1 title='Traditional Mancunian Greeting' Alright Mate!
p  Welcome to my website! My name is DAZ and I work, rest and play in Manchester,UK.
p I build websites, play water polo and eat burgers.
p Thanks for visiting. Have a nice day!
