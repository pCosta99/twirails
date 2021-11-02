Rails.application.routes.draw do
  root 'twirails#index'

  get '/home', to: 'timeline#index'
  put '/tweets/:tweet_id/like', to: 'tweets#like', as: 'tweet_like'
  put '/tweets/:tweet_id/dislike', to: 'tweets#dislike', as: 'tweet_dislike'
  put '/tweets/:tweet_id/flip_like', to: 'tweets#flip_like', as: 'tweet_flip_like'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, only: %i[show index] do
    member do
      put 'follow'
      put 'unfollow'
    end
    resources :tweets
  end
end
