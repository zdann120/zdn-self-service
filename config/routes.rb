Rails.application.routes.draw do
  resources :addresses
  get 'visitors/index'
  root to: 'visitors#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
