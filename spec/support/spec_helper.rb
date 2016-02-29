require 'webmock/rspec'
require_relative '../../lib/environment'

Dir["#{Environment::APP_ROOT}/spec/support/**/*.rb"].each { |f| require f }

WebMock.disable_net_connect!(allow_localhost: true)
