class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    # retrieve the user's inputs from params
    # create a record in the movie table
    # populate each column with the user input
    # save

    # redirected the user back to the /movies url

    #create new movie model instance and fetching data from the text field of form 
    #the values afterthe_ must match the column values of movie model and the value in "" () after fetch comes from the form name attributes for the text fields:
    
    m = Movie.new
   the_title = params.fetch("the_title")
   the_year = params.fetch("the_year")
   the_duration = params.fetch("the_duration")
   the_description = params.fetch("the_description")
   the_image = params.fetch("the_image")
   the_director_id = params.fetch("the_director_id")

   m.save

    redirect_to("/movies")
  end

  def destroy
    the_id = params.fetch("an_id")

    matching_records = Movie.where({ :id => the_id }) 
    the_movie = matching_records.at(0)
    the_movie.destroy

    redirect_to("/movies")
  end

  def update
    # get the ID out of params 
    m_id = params.fetch("the_id")

    # look up the existing record
    matching_records = Movie.where( :id => m_id)
    the_movie = matching_records.at(0)

    # Overwrite each column with the values from userrr inputs
    the_movie.title = params.fetch("the_title")
    the_year = params.fetch("the_year")
    the_duration = params.fetch("the_duration")
    the_description = params.fetch("the_description")
    the_image = params.fetch("the_image")
    the_director_id = params.fetch("the_director_id")

    # save
    the_movie.save

    # redirect to the movie details page
    redirect_to("/movies/#{the_movie.id}")
  end
end
