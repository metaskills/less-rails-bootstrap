require 'bundler'
require 'rake/testtask'

Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.libs = ['lib','test']
  t.test_files = Dir.glob("test/**/*_spec.rb").sort
  t.verbose = true
end

task :default => [:test]
task :spec => [:test]

