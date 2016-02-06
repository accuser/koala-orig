resource :session, only: [ :new, :create, :destroy ]
resources :users, only: [ :show, :new, :create ]

get '/about', to: 'pages#about'
get '/', to: 'pages#home'
