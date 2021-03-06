# frozen_string_literal: true

Rails.application.routes.draw do
  # rubocop:todo Metrics/BlockLength
  root 'welcome#index'

  get 'image/:id/serve', to: 'images#serve', as: :serve_image
  get 'e-booklet', to: 'welcome#serve_booklet', as: :serve_booklet

  resources :gallery_photos, only: :index

  resources :event_previews, only: :index

  devise_scope :user do
    get '/sign_up' => 'users/registrations#new', as: :new_user_registration

    get '/login' => 'users/sessions#new', as: :new_user_session
    post '/login' => 'users/sessions#create', as: :user_session
    delete '/logout' => 'users/sessions#destroy', as: :destroy_user_session
  end

  devise_for :users,
             skip: %i[sessions],
             controllers: {
               passwords: 'users/passwords',
               registrations: 'users/registrations',
               confirmations: 'users/confirmations',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }

  resources :events, only: %i[index show], param: :year do
    get 'load_photos',
        to: 'events#load_photos',
        as: :load_photos,
        constraints: ->(req) { req.format == :js }
  end

  get '/ticket/claim', to: 'tickets#claim', as: 'claim_ticket'
  post '/tickets/synchronize', to: 'tickets#synchronize'

  get '/sold_out_night', to: 'welcome#sold_out_night', as: 'sold_out_night'
  get '/sold_out_matinee',
      to: 'welcome#sold_out_matinee', as: 'sold_out_matinee'
  get '/buy_special', to: 'welcome#buy_special', as: 'buy_special'
  get '/donation', to: 'welcome#donation', as: 'donation'

  namespace :admin do
    root 'admin#index'

    resources :users, except: %i[new create]
    resources :frequently_asked_questions, except: :show
    resources :testimonies

    resources :events, param: 'year' do
      resources :sponsors
      resources :gallery_photos, only: %i[index new create destroy]
      resources :event_previews
    end

    resources :tickets, only: %i[create new index show destroy]
    get '/ticket/claim', to: 'tickets#claim', as: 'claim_ticket'
    post '/ticket/claim', to: 'tickets#redeem', as: nil
    post '/ticket/confirmation_email/:id',
         to: 'tickets#send_confirmation_email', as: 'ticket_email_confirmation'
    post '/tickets/clear_mock_tickets',
         to: 'tickets#clear_mock_tickets', as: 'clear_mock_tickets'

    resources :subscribers, only: %i[index destroy]
    get 'subscribers/write_email',
        to: 'subscribers#write_email', as: :write_email
    post 'subscribers/send_email', to: 'subscribers#send_email', as: :send_email
    get 'subscribers/confirm_email_sent',
        to: 'subscribers#confirm_email_sent', as: :confirm_email_sent
    get 'subscribers/sync_with_customer',
        to: 'subscribers#sync_with_customer', as: :sync_with_customer
  end

  get '/unsubscribe', to: 'admin/subscribers#unsubscribe', as: :unsubscribe
end
