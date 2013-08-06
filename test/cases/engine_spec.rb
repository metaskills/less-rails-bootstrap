require 'spec_helper'

class EngineSpec < Less::Rails::Bootstrap::Spec
  
  it 'must be able to hook into a less-rails config' do
    dummy_config.less.must_be_instance_of ActiveSupport::OrderedOptions
  end
  
  it 'must append engines assets stylesheets to less-rails load paths' do
    dummy_config.less.paths.must_be_instance_of Array
    dummy_config.less.paths.must_include project_app_twitter_bootstrap
  end
  

end
