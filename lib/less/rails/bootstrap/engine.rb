module Less
  module Rails
    module Bootstrap
      class Engine < ::Rails::Engine

        initializer 'less-rails-bootstrap.setup', :before => 'less-rails.after-setup', :group => :assets do |app|
          bootstrap_less_files = config.root + 'vendor/assets/stylesheets/twitter'
          app.config.less.paths << bootstrap_less_files
        end
        
      end
    end
  end
end
