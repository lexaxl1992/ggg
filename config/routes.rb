Rails.application.routes.draw do
  root 'main#index'
  get '/constructor', to: 'main#constructor'
  get '/admin', to: 'admin#index'
  resources :categories
  post '/items_order', to: 'items#update_order'
  resources :items
  resources :imagesets
  get '/infoblocks/:id', to: 'infoblocks#show'
  patch '/infoblocks/:id(.:format)', to: 'infoblocks#update'
  resources :phone_number
end
