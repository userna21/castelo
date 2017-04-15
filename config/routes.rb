Rails.application.routes.draw do
  resources :sames
  resources :tonans
  resources :melodies
  resources :awsubs
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  root 'pages#home'

  resources :oploverzs, only: [:index, :show]
  end
