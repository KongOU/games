Rails.application.routes.draw do
  resources :games
  root 'homepage#index'
end
