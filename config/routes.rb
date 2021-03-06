Rails.application.routes.draw do
  root "application#index"
  resources :users
  resources :potlucks do
    collection do
      get 'data'
    end
    resources :items
  end
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  get 'auth/failure', to: redirect("/")
  get '*path' => redirect('/')
end
