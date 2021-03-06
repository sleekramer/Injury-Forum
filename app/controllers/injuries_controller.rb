class InjuriesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @body_part = BodyPart.find(params[:body_part_id])
    @injury = Injury.find(params[:id])
    @top_activities = @injury.top_five_activities_array
    @post = @injury.topics.first.posts.where(body: @injury.description).first
  end

  def new
    @body_part = BodyPart.find(params[:body_part_id])
    @injury = @body_part.injuries.new
    @symptoms = Symptom.all
  end

  def create
    @body_part = BodyPart.find(params[:body_part_id])
    @injury = @body_part.injuries.new(injury_params)
    @injury.user = current_user
    if @injury.save
      @injury.generate_topics
      post = @injury.topics.first.posts.create!(title: "#{@injury.name} original description", body: @injury.description, user: current_user)
      post.votes.create!(user: current_user, value: 1)
      AddUserFeedItem.call(current_user, action_name, @injury)
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
    post = Post.where(body: @injury.description).first
    if @injury.update_attributes(injury_params)
      post.update_attribute(:body, @injury.description)
      flash[:notice] = "Update succeeded."
      redirect_to [@body_part, @injury]
    else
      flash[:error] = "An error occurred. Try updating again."
      render :edit
    end
    if @injury.description_post_highest_score != post
      @injury.update_description
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
    params.require(:injury).permit(:name, :description, symptom_ids: [], images_files: [])
  end


end
