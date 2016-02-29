#!/usr/bin/env ruby
require_relative 'lib/environment'

unless ENV['date']
  fail 'Usage: date="2015-09-16" code=BRL ./cbr_rate.rb'
end

puts CbrRatesProvider.new(ENV['date']).get(ENV['code'] || 'USD')
