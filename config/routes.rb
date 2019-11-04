Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecasts#show'
      get 'backgrounds', to: 'backgrounds#index'
      devise_for :users, defaults: { format: :json }
    end
  end
end
