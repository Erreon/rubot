require 'bundler'
require "rspec/core/rake_task"

Bundler::GemHelper.install_tasks

# the defaults work fine here
RSpec::Core::RakeTask.new :test
RSpec::Core::RakeTask.new :spec
task :default => :test