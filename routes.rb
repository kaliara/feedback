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