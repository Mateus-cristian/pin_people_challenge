# frozen_string_literal: true

source "https://rubygems.org"

gem "tailwindcss-rails", "~> 4.4"

# Rails core
gem "rails", "~> 8.1.1"

# Asset pipeline
gem "propshaft"

# Database
gem "pg", "~> 1.1"

# Web server
gem "puma", ">= 5.0"

# JavaScript and Hotwire
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# API and JSON
gem "jbuilder"

# Text segmentation and Unicode utilities
gem "pragmatic_segmenter"
gem "unicode_utils"

# Pagination
gem "kaminari"

# Charts for dashboard
gem "chartkick"
gem "chart-js-rails"

# CORS for APIs
gem "rack-cors"

# PDF export
gem "wicked_pdf"
gem "wkhtmltopdf-binary"

# Timezone support for Windows/JRuby
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Caching, background jobs, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Boot performance
gem "bootsnap", require: false

# Docker deployment
gem "kamal", require: false

# Puma asset caching/compression
gem "thruster", require: false

# Image processing for Active Storage
gem "image_processing", "~> 1.2"

# Tailwind CSS
gem "tailwindcss-rails", "~> 4.4"

group :development, :test do
  # Debugging
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Security audit
  gem "bundler-audit", require: false
  gem "brakeman", require: false

  # Code style
  gem "rubocop-rails-omakase", require: false

  # Testing
  gem "rspec-rails"
  gem "rswag"
  gem "capybara"
  gem "selenium-webdriver"
  gem "factory_bot_rails"
  gem "simplecov", require: false
end

group :development do
  # Rails console in browser
  gem "web-console"
end
