Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecasts#show'
      get 'backgrounds', to: 'backgrounds#index'
      get 'antipode', to: 'antipodes#show'

      devise_for :users, controllers: { sessions: :sessions }
      post 'login', to: 'sessions#create'
    end
  end
end
