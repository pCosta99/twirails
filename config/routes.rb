Rails.application.routes.draw do
  root 'timeline#index'

  put '/tweets/:id/like', to: 'tweets#like', as: 'tweet_like'
  put '/tweets/:id/dislike', to: 'tweets#dislike', as: 'tweet_dislike'

  devise_for :users
  resources :users, only: %i[show index] do
    member do
      get 'follow'
      get 'unfollow'
    end
    resources :tweets
  end
end
