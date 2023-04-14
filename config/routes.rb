Rails.application.routes.draw do
  root "home#index"
  resources :links, only: %i(create show)
  get "/:lookup_code", to: "links#show"
end
