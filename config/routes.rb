Rails.application.routes.draw do
  root 'static_pages#home'

  get 'static_pages/home'

  resources :users, only: [:show, :new, :create]
end
