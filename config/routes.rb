Rails.application.routes.draw do
  devise_for :users
  resources :games
  root 'homepage#index'
  get 'games/index'
end
