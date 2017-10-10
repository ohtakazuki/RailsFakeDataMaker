Rails.application.routes.draw do
  root 'pages#home'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  get    '/signup',  to:'users#new'
  post   '/signup',  to: 'users#create'
  resources :users

  # resourcesより優先するものは上に書く
  get    '/jobs/subfakers'
  post   '/jobs/download'
  resources :jobs

end
