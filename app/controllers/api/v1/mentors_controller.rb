module Api
  module V1
    class MentorsController < Api::V1::ApplicationController
      def mentors
        mentors = Mentor.includes(:expertises).all
        data = []
        mentors.each do |mentor|
          data << {
            id: mentor.id,
            name: mentor.name,
            bio: mentor.bio,
            photo: mentor.photo,
            contact: mentor.contact,
            expertises: mentor.expertises
          }
        end
        render json: data
      end

      def mentor
        mentor = Mentor.find(params[:id])
        if mentor
          render json: mentor
        else
          render json: { errors: 'Mentor not found' }
        end
      end

      def create
        mentor = Mentor.new(
          name: mentor_params[:name],
          bio: mentor_params[:bio],
          photo: mentor_params[:photo],
          contact: mentor_params[:contact]
        )
        params[:expertises]&.each do |item|
          mentor.expertises << Expertise.find(item.to_i)
        end
        if mentor.save
          mentors
        else
          render json: { error: 'Can not create mentor' }
        end
      end

      def update; end

      def destroy
        Mentor.destroy(params[:id])
        mentors
      end

      private

      def mentor_params
        params.require(:mentor).permit(:name, :bio, :photo, :contact)
      end
    end
  end
end
