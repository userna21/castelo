Rails.application.routes.draw do
  resources :movieus, only: [:index, :show]
  resources :sames, only: [:index, :show]
  resources :tonans, only: [:index, :show]
  resources :melodies, only: [:index, :show]
  resources :awsubs, only: [:index, :show]
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  root 'pages#home'

  resources :oploverzs, only: [:index, :show]
  end
