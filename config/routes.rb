Rails.application.routes.draw do
  root 'static_pages#home'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :tasks, only: [:index, :show, :new, :create, :destroy]

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
