class BodyPartsController < ApplicationController
  def show
    @body_part = BodyPart.find(params[:id])
  end
end
