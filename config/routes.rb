Rails.application.routes.draw do
  resources :events
  root 'welcome#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users, except: [:new, :create]

  get '*path'       , to: 'welcome#index'
end
