module Api
  module V1
    class ReservationsController < Api::V1::ApplicationController
      def reservations
        rvs = Reservation.all.where(user_id: current_user.id)
        render json: { status: 'ok', data: rvs }
      end

      def create
        reservation = Reservation.new(
          time: Time.parse(reservation_params[:time]),
          message: reservation_params[:message]
        )
        reservation.user = current_user
        reservation.mentor = Mentor.find(reservation_params[:mentor_id].to_i)
        if reservation.save
          render json: { status: 'ok', data: reservation }
        else
          render json: { error: 'can not create reservation' }
        end
      end

      private

      def reservation_params
        params.require(:reservation).permit(:time, :message, :mentor_id)
      end
    end
  end
end
