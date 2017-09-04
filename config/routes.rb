Rails.application.routes.draw do
  # resources :users, except: [:delete]
  resources :users
  resources :sessions, only: [:new, :create, :destroy] # sessions_path
  # get 'users/new'

  root  'static_pages#home'
  match '/test',    to: 'static_pages#test',    via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'


  # match 'users/:id/edit',  to: 'users#new',       via: 'get'

  # match '/edit', to: 'users#edit',     via: 'get'

  # get '/foo', to: 'users#new', as: :new_foo
  # post '/foo', to: 'users#create', as: :create_foo


end
