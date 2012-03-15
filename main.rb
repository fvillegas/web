########## configuration & settings ###########
configure do
  set :name, ENV['NAME'] || 'DATA'
  set :author, ENV['AUTHOR'] || 'Gaba'
  set :analytics, ENV['ANALYTICS'] || 'uA-XXXXXXXX-X'
  set :javascripts, %w[ ]
  set :fonts, %w[ Abel ]
  set :markdown, :layout_engine => :slim
  set :default_locale, 'en'
end

########## DAZ4126 website ###########
require 'bundler'
Bundler.require

get '/' do
  @title = t.vision.title
  @vision = t.vision.text
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

not_found { slim : '404'}
error { slim : '500'}

__END__
########### Views ###########

@@index
h1 title='Nuestra Visión'
p vision='La vision'

@@mision
p Mision

@@quienes
p Quienes somos

@@que
p Que Hacemos

@@contacto
p Contacto

@@404
h1 404!
p That page is missing

@@500
h1 500 error!
p Oops, something has gone terrible wrong!
