Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecasts#show'
      get 'backgrounds', to: 'backgrounds#index'
      post 'road_trip', to: 'road_trips#create'
      devise_for :users, controllers: { sessions: :sessions }
      post 'sessions', to: 'sessions#create'
    end
  end
end
