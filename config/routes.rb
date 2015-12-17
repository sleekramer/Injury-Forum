Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/about' => 'welcome#about'

  get '/disclaimer' => 'welcome#disclaimer'

end
