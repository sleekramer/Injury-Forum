class WelcomeController < ApplicationController
  def index
  end

  def about
  end

  def disclaimer
  end

  def browse
    @body_parts = BodyPart.all
  end
end
