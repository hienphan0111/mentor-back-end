class HomeController < ApplicationController
  def index
    @app_data = Doorkeeper::Application.find(1)

    @app = @app_data
  end
end
