source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "propshaft" # Asset pipeline padrão do Rails 8
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"

# JavaScript via Import Maps (Sem necessidade de Node para o JS)
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# CSS via Node.js/Yarn (O que você está usando para o Bootstrap)
gem "cssbundling-rails"

# Autenticação
gem "devise"

# JSON APIs
gem "jbuilder"

# Adaptadores do Rails 8 para Cache, Fila e Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Otimização de boot e deploy
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