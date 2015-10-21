Rails.application.routes.draw do
  apipie
  mount_devise_token_auth_for 'User', at: 'v1/auth'

  namespace :v1 do
    defaults format: 'json' do
      resources :users
      resources :projects
      resources :subscriptions
    end

    mount StripeEvent::Engine, at: '/stripe-webhooks'
  end

end
