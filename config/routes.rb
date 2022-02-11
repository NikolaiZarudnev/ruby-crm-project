Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  get 'search', to: 'categories#search'

  resource :search
  resource :session, only: %i[new create destroy]
  resources :users
  resources :products
  
end
