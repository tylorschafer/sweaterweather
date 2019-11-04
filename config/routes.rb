Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecasts#show'
      get 'backgrounds', to: 'backgrounds#index'

      resource :user, only: [:show, :update]

      resource :sessions, only: [:create]
    end
  end
end
