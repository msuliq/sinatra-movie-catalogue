#script for determining pathway for movie list

#add sinatra library
require 'sinatra'
#load movie.rb file to get movie items
require 'movie'

#action after receiveing GET /movies
get ('/movies') do
    #create new array
    @movies = []
    #create first item
    @movies[0] = Movie.new
    @movies[0].title = "Jaws"
    @movies[1] = Movie.new
    @movies[1].title = "Alien"
    @movies[2] = Movie.new
    @movies[2].title = "Terminator 2"
    #open index.erb file
    erb :index
end