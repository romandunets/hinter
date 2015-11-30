Rails.application.routes.draw do
  root 'static_pages#home'

  get 'signup'  => 'users#new'

  resources :users, only: [:show, :new, :create]
end
