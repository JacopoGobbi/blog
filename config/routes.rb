Rails.application.routes.draw do
  resources :posts
  resources :users do
    patch :follow, on: :member
  end
  root 'sessions#new'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
