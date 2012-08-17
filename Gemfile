source 'https://rubygems.org'

gem 'rails', '3.2.6'

gem 'pg'
gem 'texticle', '~> 2.0', require: 'texticle/rails'
gem 'cancan'
gem 'active_model_serializers', git: 'git://github.com/josevalim/active_model_serializers.git'
gem 'haml'
gem 'awesome_nested_set'
gem 'the_sortable_tree'
gem 'state_machine'
gem 'emailyak', git: 'git://github.com/ballantyne/emailyak.git'
gem 'premailer'
gem 'sidekiq'
gem 'paper_trail'
gem 'acts-as-taggable-on', '~> 2.3.1'
gem 'rolify'
gem 'devise'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 2.0.3'
gem 'quiet_assets'
gem 'mobylette'
gem 'jquery_mobile_rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'foreman'
  gem 'unicorn'
end

group :development, :test do
  gem 'pry-rails'
  gem 'awesome_print'
  gem 'quiet_assets'
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'spinach-rails'
  gem 'capybara-webkit'
end

group :production do
  gem 'unicorn'
end
