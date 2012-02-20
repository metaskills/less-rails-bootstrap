require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'less-rails-bootstrap'
require 'minitest/spec'
require 'minitest/autorun'
require 'dummy_app/init'

module Less
  module Rails
    module Bootstrap
      class Spec < MiniTest::Spec

        before do
          reset_caches
        end


        private

        def dummy_app
          Dummy::Application
        end

        def dummy_config
          dummy_app.config
        end

        def dummy_assets
          dummy_app.assets
        end

        def dummy_asset(name)
          dummy_assets[name].to_s.strip
        end

        def reset_caches
          dummy_assets.version = SecureRandom.hex(32)
          dummy_assets.cache.clear
        end

        def project_root
          File.expand_path File.join(File.dirname(__FILE__), '..')
        end

        def project_vendor_twitter_bootstrap
          File.join project_root, 'vendor', 'frameworks'
        end

      end
    end
  end
end

