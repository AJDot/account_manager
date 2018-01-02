AccountManager::Application.routes.draw do
  root to: 'accounts#index'

  resources :accounts, only: [:index, :create, :new, :show] do
    resources :transactions, only: [:new, :create]
  end
end
