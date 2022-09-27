Rails.application.routes.draw do
  namespace :api do 
    namespace :trello do
      resources :lists
      resources :cards
    end
  end
end
