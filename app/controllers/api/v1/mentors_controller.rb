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

      def update
      end

      def destroy
      end
    end
  end
end
