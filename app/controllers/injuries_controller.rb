class InjuriesController < ApplicationController
  before_action :authenticate_user!
  def show
    @body_part = BodyPart.find(params[:body_part_id])
    @injury = Injury.find(params[:id])
  end

  def new
    @body_part = BodyPart.find(params[:body_part_id])
    @injury = @body_part.injuries.new
  end

  def create
    @body_part = BodyPart.find(params[:body_part_id])
    @injury = @body_part.injuries.new(injury_params)
    @injury.user = current_user
    if @injury.save
      flash[:notice] = "New #{@body_part.name} injury: #{@injury.name} created."
      redirect_to [@body_part, @injury]
    else
      flash[:error] = "An error occurred. Please try again."
      render :new
    end
  end

  def edit
    @body_part = BodyPart.find(params[:body_part_id])
    @injury = @body_part.injuries.find(params[:id])
  end

  def update
    @body_part = BodyPart.find(params[:body_part_id])
    @injury = @body_part.injuries.find(params[:id])
    if @injury.update_attributes(injury_params)
      flash[:notice] = "Update succeeded."
      redirect_to [@body_part, @injury]
    else
      flash[:error] = "An error occurred. Try updating again."
      render :edit
    end
  end

  def destroy
    @body_part = BodyPart.find(params[:body_part_id])
    @injury = @body_part.injuries.find(params[:id])
    if @injury.destroy
      flash[:notice] = "Injury deleted."
      redirect_to [@body_part, @injury]
    else
      flash[:error] = "An error occurred. Try again."
      render :show
    end
  end

  private
  def injury_params
    params.require(:injury).permit(:name)
  end
end
