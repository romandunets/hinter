Rails.application.routes.draw do
  root 'static_pages#home'

  get  'signup'  => 'users#new'
  get  'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  get  'logout'  => 'sessions#destroy'

  resources :users, only: [:show, :new, :create]
end
