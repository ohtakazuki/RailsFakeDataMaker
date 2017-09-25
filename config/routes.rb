Rails.application.routes.draw do
  root 'pages#home'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :users
  get    '/signup',  to:'users#new'
  post   '/signup',  to: 'users#create'

  resources :jobs

  get 'weathers/index'

end
