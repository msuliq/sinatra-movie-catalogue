#script for determining pathway for movie list

#add sinatra library
require 'sinatra'

#action after receiveing GET /movies
get ('/movies') do
    #open index.erb file
    erb :index
end