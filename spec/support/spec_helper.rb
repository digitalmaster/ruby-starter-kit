require 'codeclimate-test-reporter'
require 'webmock/rspec'
require_relative '../../lib/environment'

CodeClimate::TestReporter.start
Dir["#{Environment::APP_ROOT}/spec/support/**/*.rb"].each { |f| require f }

WebMock.disable_net_connect!(allow_localhost: true, allow: ['api.codacy.com', 'codeclimate.com'])
