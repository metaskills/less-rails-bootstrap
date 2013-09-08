require 'rails'

module Less
  module Rails
    module Bootstrap
      class Engine < ::Rails::Engine
        
        initializer 'less-rails-bootstrap.setup', :after => 'less-rails.before.load_config_initializers', :group => :all do |app|
          app.config.less.paths << File.join(config.root, 'app', 'frameworks')
        end
        
      end
    end
  end
end
