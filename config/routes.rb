Rails.application.routes.draw do
  root 'timeline#index'

  devise_for :users
  resources :users, only: %i[show index] do
    member do
      get 'follow'
      get 'unfollow'
    end
    resources :tweets
  end
end
