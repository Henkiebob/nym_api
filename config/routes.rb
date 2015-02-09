Rails.application.routes.draw do

  namespace :api do
      resources :tasks
      resources :users
      resources :houses
      resources :sessions
      resources :logs

      get 'houses/habitants/:id', :to => 'houses#get_habitants'
      get 'houses/send_invite_mail/:id', :to => 'houses#send_invite_mail'
      get 'users/avatar/:id', :to => 'users#avatar'

      post 'users/upload/:id', :to => 'users#upload'
      put 'users/upload/:id', :to => 'users#upload'
  end

  resources :statistics

end
