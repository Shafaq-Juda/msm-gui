class DirectorsController < ApplicationController
  def create
    # retrieve the user's inputs from params
    # create a record in the movie table
    # populate each column with the user input
    # save

    # redirected the user back to the /movies url

    #create new movie model instance and fetching data from the text field of form 
    #the values afterthe_ must match the column values of director model and the value in "" () after fetch comes from the form name attributes for the text fields:
    
    director = Director.new
    director.name = params.fetch("the_name")
    director.dob = params.fetch("the_dob")
    director.bio = params.fetch("the_bio")
    director.image = params.fetch("the_image")

    director.save

    redirect_to("/directors")
  end

 def destroy
    the_id = params.fetch("an_id")

    matching_records = Director.where({ :id => the_id }) 
    the_director = matching_records.at(0)
    the_director.destroy

    redirect_to("/directors")
  end

  def update
    # get the ID out of params 
    director_id = params.fetch("the_id")

    # look up the existing record
    matching_records = Director.where( :id => director_id)
    @the_director = matching_records.at(0)

    # Overwrite each column with the values from userrr inputs
    @the_director.name = params.fetch("the_name")
    @the_director.dob = params.fetch("the_dob")
    @the_director.bio = params.fetch("the_bio")
    @the_director.image = params.fetch("the_image")

    # save
    @the_director.save

    # redirect to the movie details page
    redirect_to("/directors/#{@the_director.id}")
  end


  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

end
