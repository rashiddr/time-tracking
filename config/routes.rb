Rails.application.routes.draw do
  resources :daily_status
  resources :projects
  devise_for :users
  root :to =>'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
