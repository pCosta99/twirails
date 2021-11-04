# frozen_string_literal: true

Rails.application.routes.draw do
  root 'twirails#index'

  get '/home', to: 'timeline#index'

  # Like / dislike / flip tweet
  put '/tweets/:tweet_id/like', to: 'tweets#like', as: 'tweet_like'
  put '/tweets/:tweet_id/dislike', to: 'tweets#dislike', as: 'tweet_dislike'
  put '/tweets/:tweet_id/flip_like', to: 'tweets#flip_like', as: 'tweet_flip_like'

  # Custom error handling
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'

  # Dark/Light mode
  get '/moon', to: 'application#moon', as: 'moon'
  get '/sun', to: 'application#sun', as: 'sun'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, param: :name, only: %i[show index] do
    member do
      put 'follow'
      put 'unfollow'
      get 'followers'
      get 'following'
    end
    resources :tweets
  end
end
