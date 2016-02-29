#!/usr/bin/env ruby
require_relative 'lib/environment'

raise 'Usage: date="2015-09-16" code=BRL ./cbr_rate.rb' unless ENV['date']

puts CbrRatesProvider.new(ENV['date']).get(ENV['code'] || 'USD')
