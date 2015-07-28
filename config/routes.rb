Rails.application.routes.draw do
  resources :games
  root 'homepage#index'
  get 'games/index'
end
