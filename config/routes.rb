Rails.application.routes.draw do
  
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create' 
  
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  

  delete '/logout' => 'sessions#destroy'
  
  match 'auth/github/callback', to: 'sessions#github_create', via: [:get, :post]

  resources :users
  resources :languages
  resources :vocabs
  resources :examples

  resources :vocabs do 
    resources :examples 
  end 
  
end
