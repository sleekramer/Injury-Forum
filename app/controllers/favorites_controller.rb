class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @favoriteable = injury_or_post
    @favorite = current_user.favorites.new(favoriteable: @favoriteable)
    if @favorite.save
      flash[:notice] = "#{@favoriteable.class.name} followed."
    else
      flash[:error] = "An error occurred. Please try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @favoriteable = injury_or_post
    @favorite = current_user.favorites.find(params[:id])
    if @favorite.destroy
      flash[:notice] = "#{@favoriteable.class.name} unfollowed."
    else
      flash[:error] = "An error occurred. Please try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def injury_or_post
    if params[:post_id]
      Post.find(params[:post_id])
    elsif params[:injury_id]
      Injury.find(params[:injury_id])
    end
  end
end
