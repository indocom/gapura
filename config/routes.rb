Rails.application.routes.draw do
  root 'welcome#index'

  get '/past_events', to: 'past_events#index', as: 'past_events' 
  
  # devise_for :users, controllers: { sessions: 'users/sessions'}

  get '*path'       , to: 'welcome#index'
end
