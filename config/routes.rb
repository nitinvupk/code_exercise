Rails.application.routes.draw do
  #api
  namespace :api do
    namespace :v1 do
      resources :cars, only: [:show] do
      end
    end    
  end    

end
