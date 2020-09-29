Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create' 
  # these are to hide /users from the path
  
  #login 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  #logout 
  delete '/logout' => 'sessions#destroy'
  
  match 'http://vocabbank.herokuapp.com/auth/github/callback', to: 'sessions#github_create', via: [:get, :post]

  resources :users
  resources :languages
  resources :vocabs
  resources :examples

  resources :vocabs do 
    resources :examples 
  end 
  
end
