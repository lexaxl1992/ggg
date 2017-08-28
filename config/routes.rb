Rails.application.routes.draw do
  root 'main#index'
  get '/about', to: 'main#about'
  get '/constructor', to: 'main#constructor'
  get '/admin', to: 'admin#index'
  resources :about_block
  resources :categories
  resources :items
  resources :imagesets
end
