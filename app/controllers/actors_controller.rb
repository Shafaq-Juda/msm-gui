class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    # retrieve the user's inputs from params
    # create a record in the actor table
    # populate each column with the user input
    # save

    # redirected the user back to the /actors url

    #create new actor model instance and fetching data from the text field of form 
    #the values after actor. must match the column values of actor model and the value in "" () after fetch comes from the form name attributes for the text fields:
    
    actor = Actor.new
    actor.name = params.fetch("the_name")
    actor.dob = params.fetch("the_dob")
    actor.bio = params.fetch("the_bio")
    actor.image = params.fetch("the_image")

    actor.save

    redirect_to("/actors")
  end

 def destroy
    the_id = params.fetch("an_id")

    matching_records = Actor.where({ :id => the_id }) 
    the_actor = matching_records.at(0)
    the_actor.destroy

    redirect_to("/actors")
  end

  def update
    # get the ID out of params 
    actor_id = params.fetch("the_id")

    # look up the existing record
    matching_records = Actor.where( :id => actor_id)
    @the_actor = matching_records.at(0)

    # Overwrite each column with the values from userrr inputs
    @the_actor.name = params.fetch("the_name")
    @the_actor.dob = params.fetch("the_dob")
    @the_actor.bio = params.fetch("the_bio")
    @the_actor.image = params.fetch("the_image")

    # save
    @the_actor.save

    # redirect to the movie details page
    redirect_to("/actors/#{@the_actor.id}")
  end

end
