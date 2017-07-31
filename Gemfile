source 'https://rubygems.org'
ruby '2.3.1'

gem 'activesupport'

group :development do
  gem 'guard-rspec', require: false
  gem 'guard-bundler'
  gem 'guard-rubocop', require: false
end

group :development, :test do
  gem 'rspec'
end

group :test do
  gem 'simplecov', require: false                   # Test coverage reporting
  gem 'webmock'                                     # disallow real HTTP reqs from specs
end
