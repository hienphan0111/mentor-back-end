module Api
  module V1
    class MentorsController < Api::V1::ApplicationController
      def index
        @mentors = Mentor.all
        render json: @mentors
      end

      def mentors
        mentors = Mentor.all
        render json: mentors
      end

      def mentor
        mentor = Mentor.find(params[:id])
        render json: mentor
      end

      def create
        mentor = Mentor.new(
          name: mentor_params[:name],
          bio: mentor_params[:bio],
          photo: mentor_params[:photo],
          contact: mentor_params[:contact]
        )
        if mentor.save
          render json: { status: 'ok' }
        else
          render json: { error: 'Can not create mentor' }
        end
      end

      def update; end

      def destroy; end

      private

      def mentor_params
        params.require(:mentor).permit(:name, :bio, :photo, :contact, :expertises_id)
      end
    end
  end
end
