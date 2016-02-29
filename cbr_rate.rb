#!/usr/bin/env ruby
require_relative 'config/environment'

puts CbrRatesProvider.new(ENV['date']).get('USD')
