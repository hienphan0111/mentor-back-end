module Api
  module V1
    class ExpertisesController < Api::V1::ApplicationController
      def expertises
        @expertises = Expertise.all
        render json: @expertises
      end

      def create
        expertise = Expertise.new(expertise_params)
        if expertise.save
          expertises = Expertise.all
          render json: expertises
        else
          render json: { error: 'can not create expertise' }
        end
      end

      def destroy
        Expertise.destroy(params[:id])
        expertise = Expertise.all
        render json: expertise
      end

      private

      def expertise_params
        params.require(:expertise).permit(:name, :description, :icon)
      end
    end
  end
end
