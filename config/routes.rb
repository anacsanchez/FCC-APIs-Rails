Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    get '/timestamp', to: 'timestamp#show'
    get '/timestamp/:string', to: 'timestamp#show'

    get '/whoami', to: 'whoami#index'

    get '/shorturl/:id', to: 'shorturl#show'
    post '/shorturl/new', to: 'shorturl#create'

    namespace :exercise do
      resources :users, only: [:index, :create, :show] do
        resources :log, only: [:index, :create, :show]
      end
    end
  end
end
