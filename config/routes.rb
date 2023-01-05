Rails.application.routes.draw do # rubocop:todo Metrics/BlockLength
  namespace :api, defaults: { format: :json } do # rubocop:todo Metrics/BlockLength
    namespace :v1 do # rubocop:todo Metrics/BlockLength
      get 'me', to: 'users#me'
      post 'auth/login', to: 'authentication#login'
      post 'auth/google', to: 'authentication#google'
      resources :job_boards do
        member do
          post :custom_domain
          post :refresh_ssl
        end
      end
      resources :jobs do
        resources :candidates, only: %i[index show update]
      end
      resources :users
      resources :organizations do
        resource :organizations_users, only: [] do
          put :active
        end
      end

      resources :notifications

      namespace :publics do
        resources :organizations, only: [:show] do
          resource :job_board, only: [:show]
          resources :jobs, only: %i[index show] do
            member do
              post :apply
            end
          end
        end
      end
    end
  end

  constraints host: Rails.application.credentials[Rails.env.to_sym][:jobs_domain] do
    get '/:organization_slug', to: 'jobs#index', defaults: { default_domain: true }
    get '/:organization_slug/:job_slug', to: 'jobs#show', defaults: { default_domain: true }
  end

  get '/:job_slug', to: 'jobs#show'
  root 'jobs#index'
  mount ActionCable.server => '/cable'
end
