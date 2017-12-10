#!/usr/bin/env ruby
require_relative '../lib/environment'

raise 'Usage: repo=octokit.rb bin/app.rb' unless ENV['repo']

puts Main.new(ENV['repo']).run
