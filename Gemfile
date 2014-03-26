source 'https://rubygems.org'

ruby '2.1.1'
gem 'rails', '4.0.2'
gem 'pg', '~> 0.17.1'

gem 'haml-rails', '~> 0.5'

gem 'foundation-rails', '~> 5.1'
gem 'foundation-icons-sass-rails'

gem 'turbolinks', '~> 2.2.1'

gem 'jbuilder', '~> 1.2'
gem 'jquery-rails', '~> 3.1.0'

group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end

group :production, :staging do
  gem "puma",                               "~> 2.8.1"
  gem 'rails_12factor',                     "~> 0.0.2"
end

group :development, :test do
  gem 'thin', '~> 1.6.1'
  gem 'byebug', '~> 2.7.0'
end

group :development do
  gem 'guard-livereload', '~>2.1.1', require: false
  gem "guard-rspec", "~> 4.2.8", require: false
  gem "better_errors", "~> 1.1.0"
  gem 'binding_of_caller', '~> 0.7.2'
end

group :test do
  gem "factory_girl_rails",                 "~> 4.4.0"
  gem 'rspec-rails',                        "~> 2.14.1"
  gem 'shoulda-matchers',                   "~> 2.5.0"
  gem 'simplecov',                          '~> 0.7.1'
end

gem "devise", "~> 3.2.3"
gem "cancancan", "~> 1.7.1"
gem 'bcrypt', '~> 3.1.7'
gem 'stamp', '~> 0.5.0'