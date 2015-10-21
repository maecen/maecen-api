source 'https://rubygems.org'

# server
ruby '2.2.1'
gem 'rails', '4.2.4'
gem 'rails-api'
gem 'active_model_serializers', git: 'https://github.com/rails-api/active_model_serializers.git'
gem 'pg'
gem 'thin'

# authentication
gem 'devise'
gem 'omniauth'
gem 'devise_token_auth'
gem 'pundit', '1.0.1'
gem 'rolify', '4.1.1'
gem 'rack-cors', require: 'rack/cors'

# payment
gem 'stripe'
gem 'stripe_event'

# api
gem 'apipie-rails', github: 'Apipie/apipie-rails', ref: '928bd858fd14ec67eeb9483ba0d43b3be8339608'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'ultrahook'
  gem 'figaro'
  gem 'stripe-ruby-mock', '~> 2.2.0', :require => 'stripe_mock'
end

group :development do
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
end


