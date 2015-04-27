# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "less/rails/bootstrap/version"

Gem::Specification.new do |gem|
  gem.name          = 'less-rails-bootstrap'
  gem.version       = Less::Rails::Bootstrap::VERSION
  gem.authors       = ['Ken Collins']
  gem.email         = ['ken@metaskills.net']
  gem.homepage      = 'http://github.com/metaskills/less-rails-bootstrap'
  gem.summary       = 'CSS toolkit from Twitter For Rails 3.1+ Asset Pipeline'
  gem.description   = 'CSS toolkit from Twitter For Rails 3.1+ Asset Pipeline. Best one of all!'
  gem.license       = 'MIT'
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
  gem.add_runtime_dependency     'less-rails', ['>= 2.6', '<= 2.8']

  gem.add_development_dependency 'minitest', '>= 4.0'
  gem.add_development_dependency 'guard-minitest'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'rails',  ['>= 3.1', '<= 4.2']
  gem.add_development_dependency 'appraisal'
end
