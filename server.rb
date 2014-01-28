# landing page
get '/' do
  haml :index
end


# new entry
get '/entry' do
  @items = Item.all.shuffle
  haml :entry
end


# thanks
get '/thanks' do
  haml :thanks
end