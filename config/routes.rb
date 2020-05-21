Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Development only routes
  if Rails.env.development?

    # Sidekiq UI (Not secured route)
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end
end
