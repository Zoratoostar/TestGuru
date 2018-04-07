Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tests#entry'

  devise_for :users, path: :goorus, path_names: { sign_in: :login, sign_out: :logout },
             controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_evaluations, only: [:show, :update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answer_options, shallow: true
      end
    end
  end

  # get '/tests/:category/:title', to: 'tests#search', level: 0
  # get '/tests/:id/start', to: 'tests#start'
  # match '/tests/:id', to: 'tests#create', via: %i[post put]
end
