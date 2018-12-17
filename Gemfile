# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'devise-jwt', '~> 0.5.8'
gem 'by_star', git: "git://github.com/radar/by_star"
gem 'devise_token_auth'
gem 'simple_token_authentication', '~> 1.0' # see semver.org
gem 'jwt'
gem 'pg', '~> 0.21'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.1', '>= 5.1.4'
gem 'rack-cors', '~>  0.4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem 'sqlite3'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
