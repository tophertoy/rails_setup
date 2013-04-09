
# Standards and performance?
gem 'bullet'
gem 'rack-mini-profiler'
gem 'rb-fsevent', '~> 0.9'
gem 'brakeman'

# Error reporting?
gem 'better_errors'
gem 'binding_of_caller'
gem 'meta_request'

# Debugging?
gem 'pry'
gem 'pry-stack_explorer'
gem 'pry-remote'
gem 'pry-debugger'

# Testing?
gem 'rspec-rails'
gem 'cucumber-rails'

# Automating
gem 'guard-zeus'
gem 'guard-rspec'

gem 'haml-rails'

# Deployment
gem 'capistrano'
gem 'capistrano_colors'
gem 'term-ansicolor'

group :staging do
  gem 'mail_safe'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'konacha'

  gem 'letter_opener'
  gem 'simplecov',  require: false
end

group :development, :staging do
  gem 'oink',  '~> 0.10.1',  require: 'oink'
end

#  'zeus' - don't include but have installed!
