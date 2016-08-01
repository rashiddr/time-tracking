Rails.application.routes.draw do
  resources :daily_statuses
  resources :admin
  resources :projects
  resources :birthdays
  resources :list_projects
  resources :verify_statuses do
  	get :autocomplete_user_first_name, :on => :collection
  end
  devise_for :users
  get 'users/list_users', to: 'users#list_users', as: 'list_users'
  get '/users/:id', to: 'users#show', as: 'show_user'
  root :to =>'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
