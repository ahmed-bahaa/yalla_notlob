Rails.application.routes.draw do
<<<<<<< HEAD
  resources :friendships
  post '/friendships/create', to: 'friendships#create'
  post '/friendships/destroy', to: 'friendships#destroy'
=======
  resources :groups
  # get 'groups/index'
  # get 'groups/show'
  # get 'groups/new'
  # get 'groups/edit'
  # get 'groups/destroy'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
>>>>>>> 033e0c0e25d2933675e70f741f0120408966bdd9
  get 'order/index'
  get 'order/toitem'
  get 'order/show'
  get 'order/new'
  post 'order/create'
  get 'order/edit'
  get 'order/toitem'
  post 'order/update' 
  get 'order/destroy'
  get 'user/index'
  get 'user/friend'
  post 'user/addfriend'
  root to: 'user#index'
  get 'item/index'
  get 'item/show'
  get 'item/new'
  post 'item/create'
  get 'item/edit'
  get 'item/update' 
  get 'item/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
