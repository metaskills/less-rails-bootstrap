module Less
  module Rails
    module Bootstrap
      class Engine < ::Rails::Engine
        
        config.after_initialize do |app|
          bootstrap_less_files = config.root + 'vendor/stylesheets/twitter/bootstrap'
          app.config.less.paths << bootstrap_less_files
        end
        
      end
    end
  end
end
