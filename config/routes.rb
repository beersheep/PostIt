PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
    resource :comments, only: [:create]
  end

  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:create]
  get '/register', to: 'users#new'
 
end
