Rails.application.routes.draw do
  root 'main#index'
  get '/about', to: 'main#about'
  get '/constructor', to: 'main#constructor'
  get '/admin', to: 'admin#index'
  resources :about_block
  resources :phone_number
  resources :categories
  post '/items_order', to: 'items#update_order'
  resources :items
  resources :imagesets
end
