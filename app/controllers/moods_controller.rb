class MoodsController < ApplicationController

  # only show @current_user information

  def index
    matching_moods = @current_user.moods

    @list_of_moods = matching_moods.order({ :created_at => :desc })

    render({ :template => "moods/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_moods = Mood.where({ :id => the_id })

    @the_mood = matching_moods.at(0)

    render({ :template => "moods/show.html.erb" })
  end

  def create
    the_mood = Mood.new
    the_mood.label = params.fetch("query_label")
    the_mood.user_id = @current_user.id

    if the_mood.valid?
      the_mood.save
      redirect_to("/moods", { :notice => "Mood created successfully." })
    else
      redirect_to("/moods", { :notice => the_mood.errors.full_messages })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_mood = Mood.where({ :id => the_id }).at(0)

    the_mood.label = params.fetch("query_title")

    if the_mood.valid?
      the_mood.save
      redirect_to("/moods/#{the_mood.id}", { :notice => "Mood updated successfully."} )
    else
      redirect_to("/moods/#{the_mood.id}", { :alert => "Mood failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_mood = Mood.where({ :id => the_id }).at(0)

    the_mood.destroy

    redirect_to("/moods", { :notice => "Mood deleted successfully."} )
  end
end
