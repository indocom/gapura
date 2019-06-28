Rails.application.routes.draw do
  resources :events
  root 'welcome#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, except: [:new, :create]

  get '*path'       , to: 'welcome#index'
end
