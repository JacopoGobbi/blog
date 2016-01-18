Rails.application.routes.draw do
  resources :posts
  resources :users
  root 'sessions#new'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
