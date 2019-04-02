Rails.application.routes.draw do
  get 'past_events/index'
  root 'welcome#index'
end
