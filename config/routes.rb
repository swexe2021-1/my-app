Rails.application.routes.draw do
  resources :users
  resources :reviews
  get 'top/main'
  post 'top/login'
  root 'reviews#index'
  delete 'top/logout'
end
