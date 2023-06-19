module Api
  class V1::ExpertisesController < Api::ApplicationController
    def index
      @expertises = Expertise.all
      render json: @expertises
    end
  end
end
