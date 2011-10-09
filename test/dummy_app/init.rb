require 'sprockets/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_view/base'
require 'action_controller/base'

module Dummy
  class Application < ::Rails::Application

    config.root = File.join __FILE__, '..'
    config.active_support.deprecation = :stderr
    config.cache_store = :memory_store
    config.consider_all_requests_local = true
    
    config.assets.enabled = true
    config.assets.cache_store = config.cache_store
    
  end
end

Dummy::Application.initialize!
