# Provided, don't edit
require 'pry'
require 'directors_database'
pp directors_database

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end
  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end
#
# Your code after this point--------------------------
#
def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection of movies and a directors name to the movie_with_director_name method and accumulate the returned Array of movies into a new Array that's returned by this method.
  
  director_collection = []
  i = 0 
  while i < movies_collection.length do
    director_collection << movie_with_director_name(name, movies_collection[i]) 
  # INPUT:
  # name: A director's name
  # movies_collection: An Array of Hashes where each Hash represents a movie

  i += 1 
  end 
  director_collection
  
  # RETURN:
  # Array of Hashes where each Hash represents a movie; however, 
  # they should all have a :director_name key. This addition can 
  # be done by using the provided movie_with_director_name method
  end


def gross_per_studio(collection)
  # GOAL: Given AoH where each Hash reps a movie, return a Hash 
  # with the total worldwide_gross of all movies from each studio
  # INPUT: collection: Array of Hashes where each Hash where each Hash represents a movie
   
  movie_gross = {}
  # 
  # iterate through movies, for each studio, running total of worldwide_gross
  i = 0 
  while i < collection.length do
    current_studio = collection[i][:studio]

    if !movie_gross[current_studio]
      movie_gross[current_studio] = collection[i][:worldwide_gross]
    else
      movie_gross[current_studio] += collection[i][:worldwide_gross]
    end
    
  i += 1 
  end
  
  # RETURN: Hash whose keys are the studio names and whose values are sum 
  # total of all the worldwide_gross numbers for every movie in the input Hash
 
movie_gross
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  # INPUT: source: An AoH containing director information including :name and :movies
  
  movies_array = []
  i = 0 
  while i < source.length do 
    director_info = source[i]
    director_name = director_info[:name]
    directors_movies = director_info[:movies]
    
    movies_array << movies_with_director_key(director_name, directors_movies)

    i += 1 
  end
  # RETURN: AoA with all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
  movies_array
end


# --------------End of Your Code Region-------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
