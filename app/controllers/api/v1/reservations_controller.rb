module Api
  module V1
    class ReservationsController < Api::V1::ApplicationController
      def reservations
        rvs = Reservation.includes(:mentor).all.where(user_id: current_user.id)
        data = []
        rvs&.each do |reser|
          data << {
            id: reser.id,
            mentor: reser.mentor,
            expertises: reser.mentor.expertises,
            time: reser.time, message: reser.message
          }
        end
        render json: {
                  status: 'ok',
                  data: data }
      end

      def create
        reservation = Reservation.new(
          time: reservation_params[:time],
          message: reservation_params[:message]
        )
        reservation.user = current_user
        reservation.mentor = Mentor.find(reservation_params[:mentor_id].to_i)
        if reservation.save
          reservations
        else
          render json: { error: 'can not create reservation' }
        end
      end

      def destroy
        Reservation.destroy(params[:id].to_i)
        reservations
      end

      private

      def reservation_params
        params.require(:reservation).permit(:time, :message, :mentor_id)
      end
    end
  end
end
