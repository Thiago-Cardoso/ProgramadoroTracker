Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  get 'config/', to: 'pages#get_config', as: :get_task
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
