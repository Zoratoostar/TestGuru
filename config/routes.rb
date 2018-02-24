Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  # get '/tests/:category/:title', to: 'tests#search', lvl: 0

  # get '/tests/:id/start', to: 'tests#start'
  #
  # get '/tests/:id/start', to: 'tasks#start'
  #
  # match '/tests/:id', to: 'tests#create', via: %i[post put]

end
