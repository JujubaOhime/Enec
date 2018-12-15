Rails.application.routes.draw do
  scope(path_names: { new: 'criar', edit: 'editar' }) do
    resources :interests, path: 'juros'
    resources :parcels, path: 'parcelas'
    resources :payments, path: 'pagamentos'
    resources :packages, path: 'pacotes'
    resources :sponsors_and_supporters_titles, path: 'titulo-de-patrocionadores-e-apoiadores'
    resources :event_realizers_titles, path: 'titulo-de-realizadores-do-evento'
    resources :ies, path: 'instituicoes-de-ensino-superior'
    root to: 'static_pages#landing_page'
    get '/edicao-secoes', to: 'static_pages#sections_edit', as: 'sections_edit'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy', as: 'logout'
    get 'usuarios/:id/alteracao-de-senha', to: "users#change_password"
    post 'usuarios/:id/alteracao-de-senha', to: "users#change_password", as: 'change_password'
    get 'usuarios/:id/selecao-de-pacote', to: "users#therm_agreement"
    post 'usuarios/:id/selecao-de-pacote', to: "users#therm_agreement", as: 'therm_agreement'
    resources :sponsors_and_supporters, path: 'patrocionadores-e-apoiadores'
    resources :event_realizers, path: 'realizadores-do-evento'
    resources :merchandising_videos, path: 'video-de-divulgacao'
    resources :event_notices, path: 'noticias-do-evento'
    resources :the_speakers, path: 'palestrantes'
    resources :airfares, path: 'passagens-aereas'
    resources :the_events, path: 'eventos'
    resources :showcases, path: 'vitrine'
    resources :users, path: 'usuarios'
    resources :lots, path: 'lotes'

    post '/contato/enviar-email', to: 'static_pages#send_email', as: 'send_contact_email'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
