Rails.application.routes.draw do

  namespace :api do
    resources :decks
  end
end
