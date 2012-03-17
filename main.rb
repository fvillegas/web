require 'bundler'
Bundler.require

########## configuration & settings ###########
set :name, ENV['NAME'] || 'DATA'
set :author, ENV['AUTHOR'] || 'Gaba'
set :analytics, ENV['ANALYTICS'] || 'uA-XXXXXXXX-X'
set :javascripts, %w[ ]
set :fonts, %w[ Abel ]
set :markdown, :layout_engine => :slim
set :default_locale, 'en'
set :public_folder, File.dirname(__FILE__) + '/static'

########## DAZ4126 website ###########
get '/' do
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

not_found do 
  slim '404'
end

error do
  slim '500'
end

__END__
########### Views ###########
@@404
h1 404!
p That page is missing

@@500
h1 500 error!
p Oops, something has gone terrible wrong!
