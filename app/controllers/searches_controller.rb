class SearchesController < ApplicationController
  include PgSearch
  def show

    @results = PgSearch.multisearch(params[:query]).to_a
  end
end
