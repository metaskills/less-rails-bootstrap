require 'rubygems'
require 'bundler'
Bundler.require
require 'less-rails-bootstrap'
require 'minitest/autorun'
require 'minitest/spec'
require 'dummy_app/init'
require 'fileutils'

module Less
  module Rails
    module Bootstrap
      class Spec < MiniTest::Spec
        
        include FileUtils
        
        class << self
          
          def dummy_app
            Dummy::Application
          end

          def dummy_tmp
            "#{dummy_app.root}/tmp"
          end
          
        end
        
        before do
          prepare_cache_dir
          reset_config_options
          reset_caches
        end
        
        protected
        
        delegate :dummy_app, :dummy_tmp, :to => :'self.class'

        def dummy_config
          dummy_app.config
        end
        
        def dummy_assets
          dummy_app.assets
        end
        
        def dummy_asset(name)
          dummy_assets[name].to_s.strip
        end
        
        def reset_config_options
          dummy_config.less.compress = false
        end
        
        def reset_caches
          dummy_assets.version = SecureRandom.hex(32)
          cache = dummy_assets.cache
          if cache.is_a? Sprockets::Cache::FileStore
            path = cache.instance_variable_get(:@root)
            cache = Sprockets::Cache::FileStore.new(path)
          else
            cache.clear
          end
        end
        
        def prepare_cache_dir
          mkdir_p "#{dummy_tmp}/cache/assets"
        end

        def project_root
          File.expand_path File.join(File.dirname(__FILE__), '..')
        end

        def project_app_twitter_bootstrap
          File.join project_root, 'app', 'frameworks'
        end
        
      end
    end    
  end
end

