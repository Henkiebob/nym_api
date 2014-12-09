Rails.application.routes.draw do
<<<<<<< HEAD
  #post '/add_user_to_task' => "tasks#add_user_to_task"
  #delete '/remove_user_from_task' => "tasks#remove_user_from_task"

  namespace :api do
      resources :tasks
      resources :users
      resources :houses
      resources :sessions

      #get '/get_habitants' => "houses#get_habitants"
      get 'houses/habitants/:id', :to => 'houses#get_habitants'
      #put 'users/avatar/:id', :to => 'users#avatar'
=======

  root 'dashboard#index'

  resources :users
  resources :houses
  resources :sessions
  resources :password_resets
  resources :dashboard
  resources :settings
  resources :tasks

  get '/log_in' => "sessions#new", as: 'log_in'
  get '/log_out' => "sessions#destroy", as: 'log_out'
  get '/set_user' => "dashboard#set_user_session", as: 'set_user'
  get '/unset_user' => "dashboard#unset_user_session", as: 'unset_user'
  get "password_resets/new"

  post '/add_user_to_task' => "tasks#add_user_to_task"
  delete '/remove_user_from_task' => "tasks#remove_user_from_task"

  namespace :api, :defaults => {:format => :json} do
      resources :tasks
>>>>>>> e69cc23fa9908ce52e526e265dc2367b13d7503b
  end

end
