require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint'
PuppetLint.configuration.send("disable_80chars")
PuppetLint.configuration.send('disable_class_parameter_defaults')

# Blacksmith
begin
  require 'puppet_blacksmith/rake_tasks'
rescue LoadError
  puts "Blacksmith needed only to push to the Forge"
end

# set BEAKER_set to the basename of the nodeset you want to test against
desc "Run acceptance tests"
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end
