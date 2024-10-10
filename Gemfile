# frozen_string_literal: true

source "http://rubygems.org"

gemspec

gem 'rails', '~> 7.1.3'

group :development, :test do
  gem "autoprefixer-rails", "~> 8.1.0"
  gem "byebug",             "~> 10.0.0", platforms: %i[mri mingw x64_mingw]
  gem "capybara",           "~> 3.26"
  gem "kaminari",           "~> 1.2.2"
  gem "puma",               "~> 3.12.2"
  gem "rexml",              "~> 3.2.5"
  gem "rubocop",            "~> 0.55.0", require: false
  gem "selenium-webdriver", "~> 4.0.0"
  gem "sqlite3",            "~> 1.4.2"
end

group :development do
  gem "listen",       "~> 3.9.0"
  gem "web-console",  "~> 3.5.1"
end

group :test do
  gem "coveralls",                "~> 0.8.21", require: false
  gem "diffy",                    "~> 3.2.0"
  gem "equivalent-xml",           "~> 0.6.0"
  gem "mocha",                    "~> 1.3.0", require: false
  gem "rails-controller-testing", "~> 1.0.5"
end
