Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Base Routes, Will probably need to add more as I build out front end
  namespace :api do
    namespace :v1 do
      post '/home', to: 'users#create'
      get '/users', to: 'users#index'
      get '/current_user', to: 'users#show'

      post '/signup', to: 'users#signup'
      post '/login', to: 'users#login'
      get '/currentuser', to: 'users#find_current_user'


      post '/workouts', to: 'workouts#create'
      get '/workouts', to: 'workouts#index'
      delete '/workouts/:id', to: 'workouts#destroy'

      post'/userworkouts', to: 'user_workouts#create'
    end
  end
end
