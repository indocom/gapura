Rails.application.routes.draw do
  get 'past_events/index'
  devise_for :users, controllers: { sessions: 'users/sessions'}
  root 'welcome#index'
end
