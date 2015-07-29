Rails.application.routes.draw do

  devise_for :users
  resources :games do
    member do
      put 'like', to: 'games#like_game'
      put 'dislike', to: 'games#dislike_game'
      put 'favorite', to: 'games#favorite_game'
    end
  end
  root 'homepage#index'
  get '/myprofile' => 'homepage#myprofile'
  get 'games/index'

end
