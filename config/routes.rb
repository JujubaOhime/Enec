Rails.application.routes.draw do
  root to: 'static_pages#landing_page'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :sponsors_and_supporters
  resources :event_realizers
  resources :merchandising_videos
  resources :event_notices
  resources :the_speakers
  resources :airfares
  resources :the_events
  resources :showcases
  resources :users
  resources :lots

  post '/contato/enviar-email', to: 'static_pages#send_email', as: 'send_contact_email'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
