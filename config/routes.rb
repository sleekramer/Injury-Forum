Rails.application.routes.draw do

  get 'topics/show'

  devise_for :users

  authenticated :user do
    root 'welcome#browse', as: :authenticated
  end
  resources :body_parts, only: [:show] do
    resources :injuries, except: [:index]
  end

  resources :injuries, except: [:index] do
    resources :symptoms
    resources :topics, only: []
  end

  resources :topics, only: [] do
    resources :posts, only: [:create, :destroy]
  end

  resources :symptoms do
    resources :injuries, except: [:index]
  end



  root to: 'welcome#index'
  get '/about' => 'welcome#about'
  get '/disclaimer' => 'welcome#disclaimer'
  get '/browse' => 'welcome#browse'
end
