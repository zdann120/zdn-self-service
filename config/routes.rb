Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :addresses
    resources :appointments
    resources :invoices
    resources :line_items

    root to: "users#index"
  end

  resources :appointments, only: [:index, :show]
  resources :invoices do
    resources :line_items
    get 'populate_address_list', to: 'invoices#populate_address_list', on: :collection
  end
  resources :addresses do
    get 'result', on: :member, to: 'addresses#show_verification_result'
  end
  get 'visitors/index'
  root to: 'visitors#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
