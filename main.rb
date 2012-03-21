require 'bundler'
Bundler.require
require 'sinatra/r18n'

########## configuration & settings ###########
set :name, ENV['NAME'] || 'DATA'
set :author, ENV['AUTHOR'] || 'Gaba'
set :analytics, ENV['ANALYTICS'] || 'uA-XXXXXXXX-X'
set :javascripts, %w[ ]
set :fonts, %w[ Abel ]
set :markdown, :layout_engine => :slim
set :public_folder, File.dirname(__FILE__) + '/static'
set :locales, %w[en es]
set :default_locale, 'en'
set :translations, './translations'

########## DAZ4126 website ###########
before do
  if params[:lang]
    session[:locale] = params[:lang] if params[:lang]
  else
    session[:locale] = settings.default_locale
  end
end

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

get '/contact' do
  slim :contact
end

get '/glosario' do
  slim :glosario
end

get '/success' do
  slim :success
end

post '/contact' do
  require 'pony'
  Pony.mail(
    :from => params[:name] + "<" + params[:email] + ">",
    :to => 'gabelula@gmail.com',
    :subject => "[DATA] " + params[:name],
    :body => params[:message],
    :port => '587',
    :via => :smtp,
    :via_options => {
      :address => 'smtp.gmail.com',
      :port    => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV['SENDGRID_USERNAME'],
      :password             => ENV['SENDGRID_PASSWORD'],
      :authentication => :plain,
      :domain => ENV['SENDGRID_DOMAIN']
  })
  redirect '/success'
end

not_found do 
  slim '404'
end

error do
  slim '500'
end

__END__
