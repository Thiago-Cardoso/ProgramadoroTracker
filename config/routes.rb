Rails.application.routes.draw do
  resources :configuration_task
  resources :categories

  resources :tasks do
    get 'check', on: :member
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  get 'config/', to: 'pages#get_config', as: :get_task

  resources :dashboard, only: [:index] do
    collection do
      get :dashboard, :stats
    end
  end
end
