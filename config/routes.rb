Rails.application.routes.draw do

  resources :movies do 
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do 
    resources :users, except: [:show]
    get '/users/:id/enable_preview', to: 'users#enable_preview', as: 'enable'
    get '/users/disable_preview', to: 'users#disable_preview', as: 'disable'
  end

  resources :users, only: [:new, :create, :show]

  resource :session, only: [:new, :create, :destroy]

  root to: 'movies#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
