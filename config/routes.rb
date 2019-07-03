Rails.application.routes.draw do
  root 'welcome#index'
  

  devise_scope :user do
    get '/sign_up'   => "users/registrations#new",   :as => :new_user_registration

    get '/login'   => "users/sessions#new",       :as => :new_user_session
    post '/login'  => 'users/sessions#create',    :as => :user_session
    delete '/logout'  => 'users/sessions#destroy',   :as => :destroy_user_session
  end

  devise_for :users, skip: [:sessions], controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :events, only: [:index, :show]

  namespace :admin do
    root 'admin#index'
    resources :events
    resources :users, except: [:new, :create]
  end
end
