resource :session, only: [ :new, :create, :destroy ]
resource :password, only: [ :edit, :update ]
resources :users, only: [ :show, :new, :create ]

get '/about', to: 'pages#about'
get '/', to: 'pages#home'
