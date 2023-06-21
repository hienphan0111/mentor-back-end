Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorization, :applications, :authorized_applications
  end
  devise_for :users
  namespace :api do
    namespace :v1 do
      resource :users, only: %i[create]
      get 'reservations/index'
      # get '/expertises', to: 'expertises#expertises'
      resource :mentors, only: [:create, :destroy] do
        get '/', to: 'mentors#mentors'
        post '/mentor/id', to: 'mentors#update'
      end

      resource :expertises, only: [:index, :create, :update, :destroy] do
        get '/', to: 'expertises#expertises'
      end

      resource :reservation, only: [:index, :create, :update, :destroy] do
        get '/', to: 'reservations#reservations'
      end
    end
  end

  root 'home#index'
end
