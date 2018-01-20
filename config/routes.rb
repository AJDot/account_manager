AccountManager::Application.routes.draw do
  root to: 'home#index'

  get '/', to: 'home#index', as: 'home'
  get '/register', to: 'holders#new', as: 'register'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :holders, only: [:create, :show, :edit, :update]
  resources :accounts, except: [:destroy] do
    resources :transactions, only: [:new, :create, :edit, :update]
  end
end
