Rails.application.routes.draw do
  resources :cards
  resources :lists
  namespace :api do 
    namespace :trello do

    end
  end
end
