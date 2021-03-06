class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    @post.user = current_user
    @new_post = @topic.posts.new

    if @post.save
      @post.votes.create!(user: @post.user, value: 1)
      AddUserFeedItem.call(current_user, action_name, @post)
      flash[:notice] = "Post created successfully."
    else
      flash[:error] = "An error occurred. Please try posting again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post deleted."
    else
      flash[:error] = "An error occurred. Try deleting the post again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
