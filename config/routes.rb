Rails.application.routes.draw do

  root :to => "homes#top"
  get 'homes/about'
  get '/signup' => 'users#new'
  post 'signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resources :users, only: [:index,:show,:edit,:update]
  resources :cosmetics, only: [:new,:create,:index,:show,:edit,:update,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
