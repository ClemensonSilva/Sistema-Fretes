source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "propshaft" # Asset pipeline padrão do Rails 8
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "cpf_cnpj"
gem 'pagy', '~> 9.3'
gem 'geocoder', '~> 1.8'
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "cssbundling-rails"

gem "devise"

gem "jbuilder"

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "ruby-lsp"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end