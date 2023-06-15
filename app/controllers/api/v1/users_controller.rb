module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: @users
      end
    end
  end
end
