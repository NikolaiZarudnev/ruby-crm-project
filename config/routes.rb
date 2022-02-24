Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  get 'search', to: 'products#search'

  resource :search

  resources :user do
    resource :supplier
  end

  resources :suppliers do
    resources :products do
      resources :orders
    end
  end
end
