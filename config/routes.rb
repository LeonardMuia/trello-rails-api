Rails.application.routes.draw do
  namespace :api do 
    namespace :trello do
      resources :cards
      resources :lists
    end
  end
end
