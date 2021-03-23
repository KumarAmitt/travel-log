Rails.application.routes.draw do

  resources :groups
  resources :travels
  root 'users#index'

  get 'users/index'
  devise_for :users

  get 'external', to: 'travels#external_travel'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
