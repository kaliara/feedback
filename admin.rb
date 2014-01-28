# before filters for admin
use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'admin' and password == 'admin'
end

# admin
get '/admin' do
  haml :admin
end