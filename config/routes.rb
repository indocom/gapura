Rails.application.routes.draw do
  root 'welcome#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :events, only: :index

  namespace :admin do
    root 'admin#index'
    resources :events, except: :index
    resources :users, except: [:new, :create]
  end

  get '*path'       , to: 'welcome#index'
end
