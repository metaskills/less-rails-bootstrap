require 'spec_helper'

class EngineSpec < Less::Rails::Bootstrap::Spec
  
  it 'must be able to hook into a less-rails config' do
    assert_instance_of ActiveSupport::OrderedOptions, dummy_config.less
  end
  
  it 'must append engines assets stylesheets to less-rails load paths' do
    assert_instance_of Array, dummy_config.less.paths
    assert_includes dummy_config.less.paths, project_app_twitter_bootstrap

  end
  

end
