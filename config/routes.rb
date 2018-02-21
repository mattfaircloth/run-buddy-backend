Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/home', to: 'users#create'
      get '/users', to: 'users#index'
      get '/current_user', to: 'users#show'
      post '/workouts', to: 'workouts#create'
      get '/workouts', to: 'workouts#index'
      delete '/workouts/:id', to: 'workouts#destroy'
    end
  end
end
