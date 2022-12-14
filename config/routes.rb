Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'me', to: 'users#me'
      post 'auth/login', to: 'authentication#login'
      resources :job_boards
      resources :jobs do
        resources :candidates, only: [:index, :show, :update]
      end
      resources :users
      resources :organizations do
        resource :organizations_users, only:[] do
          put :active
        end
      end

      namespace :publics do
        resources :organizations, only: [:show] do
          resource :job_board, only: [:show] do
            post :custom_domain
          end
          resources :jobs, only: [:index, :show] do
            member do
              post :apply
            end
          end
        end
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/:id" => "home#index"
  root "home#index"
end
