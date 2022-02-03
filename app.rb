#script for determining pathway for movie list

#add sinatra library
require 'sinatra'
#load movie.rb file to get movie items
require 'movie'

#action after receiveing GET for list of /movies
get('/movies') do
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

#action after receiving GET to add movies/new
get('/movies/new') do
    #open new.erb
    erb :new
end

#create new catalogue item based on input from new.erb
post('/movies/create') do
    @movie = Movie.new
    @movie.title = params['title']
    @movie.director = params['director']
    @movie.year = params['year']
end