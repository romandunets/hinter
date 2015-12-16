Rails.application.routes.draw do
  root 'static_pages#home'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
end
