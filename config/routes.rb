Rails.application.routes.draw do
  resources :users
  get 'users/new'

  root  'static_pages#home'
  match '/test',    to: 'static_pages#test',    via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'

end
