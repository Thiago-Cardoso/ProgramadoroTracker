Rails.application.routes.draw do
  resources :categories
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  get 'config/', to: 'pages#get_config', as: :get_task
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dashboard, only: [:index] do
    collection do
      get :dashboard, :stats
    end
  end
end
