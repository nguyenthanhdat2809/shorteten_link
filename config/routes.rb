Rails.application.routes.draw do
  root "home#index"
  resources :links, only: %i(create)
end
