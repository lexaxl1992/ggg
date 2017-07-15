Rails.application.routes.draw do
	root 'main#index'
	get '/about', to: 'main#about'
	get '/constructor', to: 'main#constructor'
	get '/admin', to: 'admin#index'
	namespace :admin do
		resources :categories
		resources :items
	end
end
