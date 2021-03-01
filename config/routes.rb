Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'try/ruby' => 'try#home'
  # post 'try/ruby' => 'try#save'
  post 'try/ruby/save' => 'try#save'
  get 'try/ruby/:code' => 'try#home'

  # to allow file extensions from github
  # http://stackoverflow.com/questions/5369654/why-do-routes-with-a-dot-in-a-parameter-fail-to-match
  get 'try/ruby/github/:code' => 'try#github_code', :constraints => { :code => /[^\/]+/ }

  get 'turtle/draw' => 'turtle#draw'

  post 'turtle/draw/save' => 'turtle#save'
  get 'turtle/draw/:code' => 'turtle#draw'

  get 'repl/try' => 'repl#get'

  #get 'auth/github/callback' => 'github#callback'

  #get 'auth/github' => 'github#authorize'

  get "sessions/new"
  resources :users

  #resources :users
  # get "user_search", :to => "users#search"

  resources :sessions, :only => [:new, :create, :destroy]

  get '/signin',  :to => 'sessions#new'
  get '/signout', :to => 'sessions#destroy'
  delete '/signout/:provider', :to => 'sessions#destroy'

  get   '/login', :to => 'sessions#new', :as => :login

  # For omniauth callback
  # Note that the /auth/github route is created by the middleware
  # https://medium.com/@woodpecker21/rails-6-how-to-implement-a-sign-in-with-github-ede6899cdf69
  # https://gist.github.com/biglovisa/aaf4099e5f8b4817dafb
  match '/auth/:provider/callback', :to => 'sessions#create', via: [:get,:post]

  match '/auth/failure', :to => 'sessions#failure', via: [:get,:post]

  get '/github/myfiles', :to => 'github#file_list'

  get 'lessons/:fname', :to => 'lessons#lesson'
  get 'lessons', :to => 'lessons#index'

end
