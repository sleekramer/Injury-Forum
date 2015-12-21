class BodyPartsController < ApplicationController
  def show
    @body_part = BodyPart.find(params[:id])
    @injuries = @body_part.injuries
  end
end
