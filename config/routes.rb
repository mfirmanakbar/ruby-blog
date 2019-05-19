Rails.application.routes.draw do

  # get 'pages/home', to: 'pages#home'
  # get 'pages/about', to: 'pages#about'

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles # this one for POST GET to CRUD

end
