class CustomDomainConstraint
  def initialize
    @custom_domain = JobBoard.custom_domains
  end

  def matches?(request)
    @custom_domain.include?(request.host)
  end
end

Rails.application.routes.draw do # rubocop:todo Metrics/BlockLength
  namespace :api, defaults: { format: :json } do # rubocop:todo Metrics/BlockLength
    namespace :v1 do # rubocop:todo Metrics/BlockLength
      get 'me', to: 'users#me'
      post 'auth/login', to: 'authentication#login'
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

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  constraints(CustomDomainConstraint.new) do
    get '/', to: 'jobs#index', defaults: { custom: true }
    get '/:job_slug', to: 'jobs#show', defaults: { custom: true }
  end

  constraints host: Rails.application.credentials[Rails.env.to_sym][:jobs_domain] do
    get '/:organization_slug', to: 'jobs#index', defaults: { custom: false }
    get '/:organization_slug/:job_slug', to: 'jobs#show', defaults: { custom: false }
  end

  root 'home#index'
end
