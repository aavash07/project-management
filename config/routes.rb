Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects do
        collection do
          get :my_projects
        end
        resources :contents, only: %i[create show index]
      end
      resources :contents, only: %i[update destroy]
      post 'auth/signin', to: 'users#login'
      post 'users/signup', to: 'users#create'
    end
  end
end
