Rails.application.routes.draw do
  resources :users
  resources :reviews
  get 'top/main'
  post 'top/login'
  root 'top#top'
  delete 'top/logout'
end
