#script for determining pathway for movie list

#add sinatra library
require 'sinatra'
#load movie.rb file to get movie items
require_relative 'lib/movie'
#load movie_store.rb to store newly added items
require_relative 'lib/movie_store'
#storing done through creating new MovieStore class and storage in movies.yml file
store = MovieStore.new('movies.yml')

#action after receiveing GET for list of /movies
get('/movies') do
    #fetch all stored catalogue items
    @movies = store.all
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
    #saves the object
    store.save(@movie)
    #redirect back to the previous page
    redirect '/movies/new'
end

#fetch movie id from storage file 
get('/movies/:id') do
    #convern id parameter to integer
    id = params['id'].to_i
    #use id to load object from storage file
    @movie = store.find(id)
    #movie data is sent to html in show.erb
    erb :show
end