Rails.application.routes.draw do

  get 'categories/:id' => 'categories#index', as: 'category'

  devise_for :users
  resources :games do
    member do
      put 'like', to: 'games#like_game'
      put 'dislike', to: 'games#dislike_game'
      put 'add_favorite', to: 'games#add_favorite'
      put 'remove_favorite', to: 'games#remove_favorite'
    end
  end

  root 'homepage#index'
  get '/myprofile' => 'homepage#myprofile'

end
