PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  
  resources :posts, except: [:destroy] do
    collection do 
      get 'page' 
    end
    resource :comments, only: [:create]
  end
  resources :pages, only: [:show]
  resources :categories, only: [:new, :create, :show]
  resources :users, only: [:create, :show, :edit, :update]
  resources :votes, only: [:create]

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
 
end
