require "bundler/gem_tasks"

# I don't want to release this publicly
Rake::Task["release"].clear


task :require_gem do
  require_relative "lib/data_structure_sandbox"
end

desc "Launch a console with code loaded"
task :console => :require_gem do
  # trick IRb into thinking it was launched normally (for setup files and such)
  ARGV.clear
  $PROGRAM_NAME = "irb"

  require "irb"
  IRB.start
end

task :spec do
  # Relies on minitest/autotest
  Dir.glob("./spec/**/*_spec.rb").each { |file| require file}
end

task :default => :spec
