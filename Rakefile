require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

task :features do
  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = 'features --format pretty'
  end
end

task :specs do
  RSpec::Core::RakeTask.new(:specs)
end

task :build do
  copy_file 'lib/robot_simulator.rb', 'bin/robot_simulator.rb'
  chmod 0755, 'bin/robot_simulator.rb'
  mv 'bin/robot_simulator.rb', 'bin/robot_simulator'
  # check $PATH contains /usr/local/bin, create if not there...
  safe_ln 'bin/robot_simulator', '/usr/local/bin'
end

task :default => :specs
