Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tests#wrap'

  # get 'users/new'
  # get 'sessions/new'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  post :close_session, to: 'sessions#close'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answer_options, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_evaluations, only: [:show, :update] do
    member do
      get :result
    end
  end

  # get '/tests/:category/:title', to: 'tests#search', lvl: 0
  # get '/tests/:id/start', to: 'tests#start'
  # match '/tests/:id', to: 'tests#create', via: %i[post put]
end
