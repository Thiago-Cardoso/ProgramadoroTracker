Rails.application.routes.draw do
  resources :categories

  resources :tasks do
    get 'check', on: :member
  end
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
