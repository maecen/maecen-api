Rails.application.routes.draw do
  resources :projects, except: [:new, :edit]
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users
end
