#script for storing added new items 
#add YAML module to store input data
require 'yaml/store'

class MovieStore
    #set default values for input data
    def initialize(file_name)
        #pathway to storage file
        @store = YAML::Store.new(file_name)
    end
    #find movie id to display list items as links
    def find(id)
        @store.transaction do
            @store[id]
        end
    end
    #load all movies stored
    def all
        #required call
        @store.transaction do
            #create array with all id keys
            @store.roots.map { |id| @store[id] }
        end
    end
    #set method for saving a movie as catalogue item
    def save(movie)
        #required transaction call
        @store.transaction do
            #if the movie has not been assigned id yet
            unless movie.id
                #find largest id value and add 1
                highest_id = @store.roots.max || 0
                movie.id = highest_id + 1
            end
            #movie is stored with respective id value
            @store[movie.id] = movie
        end
    end
end