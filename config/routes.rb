Rails.application.routes.draw do
  resources :cars
  resources :location
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	get '/login' => 'sessions#new'
  	post '/login' => 'sessions#create'
  	get '/logout' => 'sessions#destroy'
    post 'location/new' => 'location#create'
  	get '/signup' => 'users#new'
    post '/users' => 'users#create'
    root 'cars#welcome'
    get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
