Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  resources :dashboard, only: [:index] do
    collection do
      get :dashboard, :stats
    end
  end
end
