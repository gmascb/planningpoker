source 'https://rubygems.org'

ruby '2.6.0'

gem 'rails', '6.0.3.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.20'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

#Autenticação com Facebook
gem 'omniauth'
gem 'omniauth-facebook', '4.0.0'

#Autenticação com Google+ Api
gem "omniauth-google-oauth2"


#Autenticação com GitHub
gem 'omniauth-github'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#Gema para gráficos em JS
gem "chartkick"

#Gema para buscar usuários na tela de Rooms
# https://github.com/argerim/select2-rails
gem "select2-rails"

#Sprockets
gem 'sprockets', '~> 3.5', '>= 3.5.2'
gem 'sprockets-rails', :require => 'sprockets/railtie'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# JavaScript
gem 'mini_racer'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  
  #DB para Heroku deve ser PostgreSQL
  # Já está do lado de fora do grupo do Gemfile.
  # gem 'pg', '~> 0.15' 
  
  # gem 'rails_12factor'

end

# Materialize
gem 'materialize-sass'
gem 'material_icons'

gem 'rack-cors'
gem 'active_model_serializers'


#RSwag
gem 'rswag'
gem 'rswag-api'
gem 'rswag-ui'
# # group :development, :test do
gem 'rspec-rails'
gem 'rswag-specs'
# end