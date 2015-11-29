PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
    resource :comments, only: [:create]
  end

  resources :categories, only: [:new, :create, :show]
 
end
