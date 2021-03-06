Rails.application.routes.draw do
  resources :daily_statuses do
    collection do
      get 'verify_statuses'
      get 'add_status'
    end
  end
  resources :admin do
    collection do
      get 'admin_panel'
    end
  end
  resources :projects do
    collection do
      get 'latest_projects'
      get 'manage_projects'
      get 'remove_employe_from_project'
      get 'projects/auto_complete_projects'
    end
  end
  resources :trainings do
    collection do
      get 'list_training'
    end
  end
  
  devise_for :users,controllers: {registrations: 'registrations',omniauth_callbacks: 'users/omniauth_callbacks'}
  get 'user_location/change_location'
  get 'user_location/index'
  get 'user_location/set_location'
  get 'users/auto_complete_users'
  get 'users/change_logo'
  post 'users/update_logo',to: 'users#update_logo', as: 'update_logo'
  post 'user_location/update_location'
  get 'users/edit_profile', to: 'users#edit_profile', as: 'edit_profile'
  post 'users/update_profile', to: 'users#update_profile', as: 'update_profile'
  get 'users/list_users', to: 'users#list_users', as: 'list_users'
  get 'users/new_joiners', to: 'users#new_joiners', as: 'new_joiners'
  get 'users/birthdays', to: 'users#birthdays', as: 'birthdays'
  get '/users/:id', to: 'users#show', as: 'show_user'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
