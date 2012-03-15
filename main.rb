########## configuration & settings ###########
configure do
  set :name, ENV['NAME'] || 'DATA'
  set :author, ENV['AUTHOR'] || 'Gaba'
  set :analytics, ENV['ANALYTICS'] || 'uA-XXXXXXXX-X'
  set :javascripts, %w[ ]
  set :fonts, %w[ Abel ]
  set :markdown, :layout_engine => :slim
end

########## DAZ4126 website ###########
require 'bundler'
Bundler.require

get '/' do
  @title = "Nuestra Visión"
  slim :index
end

get '/mision' do
  slim :mision
end

get '/quienes' do
  slim :quienes
end

get '/que' do
  slim :que
end

get '/contacto' do
  slim :contacto
end

__END__
########### Views ###########

@@index
h1 title='Nuestra Visión'
p Thanks for visiting. Have a nice day!

@@mision
p Mision

@@quienes
p Quienes somos

@@que
p Que Hacemos

@@contacto
p Contacto
