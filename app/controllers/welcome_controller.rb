class WelcomeController < ApplicationController
  def index
  end

  def about
  end

  def disclaimer
  end

  def browse
    @body_parts = BodyPart.all
    @feed_items = FeedItem.first(10)
  end
end
