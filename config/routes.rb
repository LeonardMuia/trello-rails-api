Rails.application.routes.draw do
  namespace :api do 
    namespace :trello do
      resources :lists
      resources :cards, only: [:index, :create]
    end
  end
end
