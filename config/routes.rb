AccountManager::Application.routes.draw do
  root to: 'accounts#index'

  resources :accounts, except: [:destroy] do
    resources :transactions, only: [:new, :create, :edit, :update]
  end
end
