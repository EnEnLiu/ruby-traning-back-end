Rails.application.routes.draw do
  root 'tasks#index'

  get 'welcome',  to: 'welcome#index'
  get 'user', to: 'users#index'
  post 'login', to: 'users#sign_in'
  get 'singup', to: 'users#new'
  post 'singup', to: 'users#sign_up'
  get 'logout', to: 'users#log_out'

  resources :tasks
end
