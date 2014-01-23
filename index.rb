require 'sinatra'
require 'sinatra/assetpack'
require 'parse_resource'
require 'haml'
require 'less'

set :root, File.dirname(__FILE__) # You must set app root
set :haml, :format => :html5

register Sinatra::AssetPack

assets {
  Less.paths << "css"
  serve 'css', from: 'css'
  css :style, 'css/style.css', ['css/style.css']
  prebuild true
}


# landing page
get '/' do
  haml :index
end


# new entry
get '/entry' do
  haml :entry
end


# thanks
get '/thanks' do
  haml :thanks
end


use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'admin' and password == 'admin'
end

# admin
get '/admin' do
  haml :admin
end