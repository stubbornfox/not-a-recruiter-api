Rails.application.routes.draw do # rubocop:todo Metrics/BlockLength
  namespace :api, defaults: { format: :json } do # rubocop:todo Metrics/BlockLength
    namespace :v1 do # rubocop:todo Metrics/BlockLength
      get 'me', to: 'users#me'
      post 'auth/login', to: 'authentication#login'
      post 'auth/google', to: 'authentication#google'
      post 'auth/reset_password', to: 'authentication#reset_password'
      post 'auth/forget_password', to: 'authentication#forget_password'
      resources :job_boards do
        member do
          post :custom_domain
          post :refresh_ssl
        end
      end
      resources :rooms do
        get :participants, on: :collection
        resources :messages do
          post :upload_file, on: :member
        end
      end
      resources :jobs do
        resources :candidates, only: %i[index show update]
      end
      resources :candidates, path: :applicants
      resources :users
      resources :organizations do
        get :profile, on: :collection
        get :team, on: :collection
        post :add_member, on: :collection
        resource :organizations_users, only: [] do
          put :active
        end
      end

      resources :notifications do
        post :mark_as_read, on: :member
      end

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
