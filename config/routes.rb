Rails.application.routes.draw do

  devise_for :users

  resources :body_parts, only: [:show]

  root to: 'welcome#index'
  get '/about' => 'welcome#about'
  get '/disclaimer' => 'welcome#disclaimer'
  get '/browse' => 'welcome#browse'
end
