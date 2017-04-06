Rails.application.routes.draw do

  resources :users
  resources :loginpages
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :start
  get 'start', to: 'start#index', as: 'starta'
  root 'sessions#new'

  resources :sessions, :only => [:create]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'page/index'


  get 'kalendar/index', :to => "kalendar#data"

  match "kalendar/index", :to => "kalendar#data", :as => "data", :via => "get"

  post "kalendar/data/task", :to => "task#add"
  put "kalendar/data/task/:id", :to => "task#update"
  delete "kalendar/data/task/:id", :to => "task#delete"

end