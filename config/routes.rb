Rails.application.routes.draw do
root "sessions#home"

get '/signup' => 'users#new'
post '/signup' => 'users#create'

get '/profile' => 'users#profile'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'

delete '/logout' => 'sessions#destroy'

get "/auth/:provider/callback" => 'sessions#google'

  resources :recipes do 
    resources :comments
  end   
  resources :categories do 
    resources :recipes, only: [:new, :create, :index]
  end 
  resources :comments
  resources :users
  resources :users do 
    resources :recipes
  end 
    

  #resources :meal_weeks (stretch goal)


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end 
