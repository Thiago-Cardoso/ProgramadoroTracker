source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'devise'
gem 'jquery-rails'
gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'nokogiri', '~> 1.8', '>= 1.8.4'
gem "font-awesome-rails"
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'jquery-ui-rails'
gem 'chartjs-ror'

#pagination
gem 'kaminari'
gem 'kaminari-i18n'

gem 'rails-assets-bulma', source: 'https://rails-assets.org'

group :test do
  gem "factory_bot_rails"
  gem "ffaker"
  gem 'shoulda-matchers', '~> 3.1'
  gem 'capybara', '~> 2.13'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '3.8'
  gem 'rails-controller-testing'
  gem 'byebug', platform: :mri
  gem 'faker', '~> 1.9', '>= 1.9.1'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]