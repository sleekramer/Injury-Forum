class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def create
    @injury = Injury.find(params[:injury_id])
    @activity = @injury.activities.new(activity_params)
    @new_activity = @injury.activities.new
    if @activity.save
      @top_activities = @injury.top_five_activities_array
      flash[:notice] = "Activity data added."
    else
      flash[:error] = "An error occurred while adding your activity. Please try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @injuries = Activity.sorted_injuries(@activity.name)
  end

  private
  def activity_params
    params.require(:activity).permit(:name)
  end
end
