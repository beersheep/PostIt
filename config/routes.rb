PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
    resource :comments, only: [:create]
  end

  resources :categories, only: [:new, :create, :show], param: :name
  resources :users, only: [:create, :show, :edit, :update]
  resources :votes, only: [:create]

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
 
end
