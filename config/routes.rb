Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'me', to: 'users#me'
      post 'auth/login', to: 'authentication#login'
      resources :job_boards
      resources :jobs
      resources :candidates
      resources :users
      resources :organizations do
        resource :organizations_users, only:[] do
          put :active
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
