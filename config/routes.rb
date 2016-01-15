Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root 'welcome#browse', as: :authenticated
    get '/profile' => 'users#show'
  end
  resources :body_parts, only: [:show] do
    resources :injuries, except: [:index]
  end

  resources :injuries, except: [:index] do
    resources :symptoms
    resources :topics, only: []
    resources :activities, only: [:create]
    resources :favorites, only: [:create, :destroy]
  end

  resources :topics, only: [] do
    resources :posts, only: [:create, :destroy]
  end

  resources :symptoms do
    resources :injuries, except: [:index]
  end
  resources :posts, only: [] do
    resources :favorites, only: [:create, :destroy]
    post '/helpful' => 'votes#helpful', as: :helpful
    post '/unhelpful' => 'votes#unhelpful', as: :unhelpful
  end


  root to: 'welcome#index'
  get '/about' => 'welcome#about'
  get '/disclaimer' => 'welcome#disclaimer'
  get '/browse' => 'welcome#browse'
  get '/search' => 'searches#show'
  resources :activities, only: [:show]
end
