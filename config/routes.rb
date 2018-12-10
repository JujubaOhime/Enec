Rails.application.routes.draw do
  resources :sponsors_and_supporters_titles
  resources :event_realizers_titles
  resources :user_college_informations
  resources :ies
  root to: 'static_pages#landing_page'
  get '/sections_edit', to: 'static_pages#sections_edit', as: 'sections_edit'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'
  get 'users/:id/alteracao_de_senha', to: "users#change_password"
  post 'users/:id/alteracao_de_senha', to: "users#change_password", as: 'change_password'
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
