Rails.application.routes.draw do

  namespace :api do
      resources :tasks
      resources :users
      resources :houses
      resources :sessions
      resources :logs
      #resources :notifications

      get 'houses/habitants/:id', :to => 'houses#get_habitants'
      get 'houses/send_invite_mail/:id', :to => 'houses#send_invite_mail'
      get 'users/avatar/:id', :to => 'users#avatar'
      get 'notifications/:id', :to => 'notifications#check'

      post 'users/upload/:id', :to => 'users#upload'
      put 'users/upload/:id', :to => 'users#upload'
  end

  resources :statistics

end
