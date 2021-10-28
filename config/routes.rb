Rails.application.routes.draw do
  root 'timeline#index'

  devise_for :users
  resources :users, only: %i[show index] do
    resources :tweets
  end
end
