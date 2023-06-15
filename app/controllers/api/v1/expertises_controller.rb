class Api::V1::ExpertisesController < ApplicationController
  def index
    @expertises = Expertise.all
    render json: @expertises
  end
end
