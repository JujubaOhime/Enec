Rails.application.routes.draw do
  scope(path_names: { new: 'criar', edit: 'editar' }) do
    root to: 'static_pages#landing_page'

    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy', as: 'logout'
    
    get 'usuarios/:id/alteracao-de-senha', to: "users#change_password"
    post 'usuarios/:id/alteracao-de-senha', to: "users#change_password", as: 'change_password'
    get 'usuarios/:id/selecao-de-pacote', to: "users#term_agreement"
    post 'usuarios/:id/selecao-de-pacote', to: "users#term_agreement", as: 'term_agreement'
    
    resources :users, path: 'usuarios'
    resources :interests, path: 'juros'
    resources :parcels, path: 'parcelas'
      post '/parcelas/update_status', to: 'parcels#update_status', as: 'update_parcel_status'
    resources :payments, path: 'pagamentos'
      get '/retorna_parcelas', to: 'payments#get_parcelas'
    resources :packages, path: 'pacotes'
    resources :ies, path: 'instituicoes-de-ensino-superior'
    get '/edicao-secoes', to: 'static_pages#sections_edit', as: 'sections_edit'
    post '/contato/enviar-email', to: 'static_pages#send_email', as: 'send_contact_email'
    
    resources :sponsors_and_supporters_titles, path: 'titulo-de-patrocionadores-e-apoiadores'
    resources :event_realizers_titles, path: 'titulo-de-realizadores-do-evento'
    resources :sponsors_and_supporters, path: 'patrocionadores-e-apoiadores'
    resources :event_realizers, path: 'realizadores-do-evento'
    resources :merchandising_videos, path: 'video-de-divulgacao'
    resources :event_notices, path: 'noticias-do-evento'
    resources :the_speakers, path: 'palestrantes'
    resources :airfares, path: 'passagens-aereas'
    resources :the_events, path: 'eventos'
    resources :showcases, path: 'vitrine'
    resources :lots, path: 'lotes'

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
