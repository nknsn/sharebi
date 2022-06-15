Rails.application.routes.draw do

  root :to => "homes#top"
  get 'homes/about'
  get '/signup' => 'users#new'
  post 'signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :cosmetics, only: [:new,:create,:index,:show,:edit,:update,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :cosme_comments, only: [:create,:destroy]
  end

  resources :users, only: [:show,:edit,:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
