class SearchesController < ApplicationController
  def show
    @results = Injury.search(params[:query], index_name: [Injury.searchkick_index.name, Post.searchkick_index.name, BodyPart.searchkick_index.name, Activity.searchkick_index.name])
  end
end
