class VotesController < ApplicationController
  before_action :authenticate_user!

  def helpful
    update_vote(1)

  end

  def unhelpful
    update_vote(-1)

  end

  private

  def update_vote(value)
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user: current_user).first

    if @vote
      @vote.update_attribute(:value, value)
    else
      @vote = current_user.votes.create!(value: value, post: @post)
    end
      AddUserFeedItem.call(current_user, "vote", @vote)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
