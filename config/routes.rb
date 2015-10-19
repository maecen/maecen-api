Rails.application.routes.draw do
  apipie

  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'

    defaults format: 'json' do
      resources :users
      resources :projects
    end
  end

end
