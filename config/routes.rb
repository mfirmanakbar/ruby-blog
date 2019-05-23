Rails.application.routes.draw do

  # get 'pages/home', to: 'pages#home'
  # get 'pages/about', to: 'pages#about'

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles # this one for POST GET to CRUD

  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'

  #it means we already difined get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
