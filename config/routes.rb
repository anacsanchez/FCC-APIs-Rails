Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    get '/timestamp', to: 'timestamp#show'
    get '/timestamp/:string', to: 'timestamp#show'

    get '/whoami', to: 'whoami#index'

    get '/shorturl/:id', to: 'shorturl#show'
    post '/shorturl/new', to: 'shorturl#create'

    get '/file-metadata', to: 'file_metadata#index'
    post '/file-metadata', to: 'file_metadata#upload'

    namespace :exercisetracker  do
      resources :users, only: [:index, :create, :show] do
        resources :exercises, only: [:index, :create]
      end
    end
  end
end

# exercise => user
