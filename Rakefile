require 'rubygems'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'appraisal'

Rake::TestTask.new do |t|
  t.libs = ['lib','test']
  t.test_files = Dir.glob(["test/**/*_{spec,test}.rb"]).sort
  t.verbose = true
end

task :default => [:test]
task :spec => [:test]

desc "Setup Appraisal."
task 'appraisal:setup' do
  Rake::Task['appraisal:cleanup'].invoke
  Rake::Task['appraisal:gemfiles'].invoke
  Rake::Task['appraisal:install'].invoke
end
