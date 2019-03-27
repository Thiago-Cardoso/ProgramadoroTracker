Rails.application.routes.draw do
  resources :categories

  resources :tasks do
    get 'check', on: :member
  end
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  
  resources :dashboard, only: [:index] do
    collection do
      get :dashboard, :stats
    end
  end
end
