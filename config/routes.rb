Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users, only: [:show]
  post 'list_users', to: 'users#index', as: 'list_users'
  resources :enrollments, only: [:create, :destroy, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
  resources :events, except: [:update, :edit]
end
