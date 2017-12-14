Rails.application.routes.draw do
  root 'main#index'

  resources :categories
  resources :items
  resources :imagesets
  resources :phone_number

  get '/constructor', to: 'main#constructor'
  get '/admin', to: 'admin#index'

  post '/items_order', to: 'items#update_order'

  post '/images', to: 'images#create'
  post '/images/:id(.:format)', to: 'images#update'
  delete '/images/:id(.:format)', to: 'images#destroy'

  post '/specs', to: 'specs#create'
  patch '/specs/:id(.:format)', to: 'specs#update'
  delete '/specs/:id(.:format)', to: 'specs#destroy'

  get '/infoblocks/:id', to: 'infoblocks#show'
  patch '/infoblocks/:id(.:format)', to: 'infoblocks#update'
end
