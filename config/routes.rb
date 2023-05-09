Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :links, only: %i[create]
  get '/:lookup_code', to: 'links#show'
  get 'profile/me', to: 'profile#show'
end
