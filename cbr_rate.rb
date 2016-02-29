#!/usr/bin/env ruby
require_relative 'lib/environment'

puts CbrRatesProvider.new(ENV['date']).get('USD')
