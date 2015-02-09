Rails.application.routes.draw do
  #post '/add_user_to_task' => "tasks#add_user_to_task"
  #delete '/remove_user_from_task' => "tasks#remove_user_from_task"

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
