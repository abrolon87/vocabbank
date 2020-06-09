Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create' 
  # these are to hide /users from the path
  
  #login 
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#create'
  
  #logout 
  delete '/logout' => 'sessions#destroy'

  
  resources :users
  resources :languages
  resources :vocabs
end
