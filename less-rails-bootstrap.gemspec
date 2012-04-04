# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "less/rails/bootstrap/version"

Gem::Specification.new do |s|
  s.name        = "less-rails-bootstrap"
  s.version     = Less::Rails::Bootstrap::VERSION
  s.authors     = ["Ken Collins"]
  s.email       = ["ken@metaskills.net"]
  s.homepage    = "http://github.com/metaskills/less-rails-bootstrap"
  s.summary     = %q{CSS toolkit from Twitter For Rails 3.1 Asset Pipeline}
  s.description = %q{CSS toolkit from Twitter For Rails 3.1 Asset Pipeline. Best one of all!}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_runtime_dependency "less-rails", "~> 2.2.0"
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'guard-minitest'
  s.add_development_dependency 'rails',  '~> 3.1'
end
