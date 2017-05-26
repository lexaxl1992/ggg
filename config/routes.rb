Rails.application.routes.draw do
	root 'main#index'
	get '/about', to: 'main#about'
	get '/catalogue', to: 'catalogue#index'
end
