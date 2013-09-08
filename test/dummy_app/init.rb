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
    config.eager_load = false
    
    config.assets.enabled = true if ::Rails::VERSION::MAJOR < 4
    config.assets.cache_store = [:file_store, "#{config.root}/tmp/cache/assets/"]
    
  end
end

Dummy::Application.initialize!
