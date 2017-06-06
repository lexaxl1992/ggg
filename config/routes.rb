Rails.application.routes.draw do
	root 'main#index'
	get '/about', to: 'main#about'
	get '/adminpanel', to: 'adminpanel#index'
	resources :items, controller: 'adminpanel'
end
