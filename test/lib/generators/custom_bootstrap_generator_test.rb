require 'spec_helper'
require 'rails/generators/test_case'
require 'generators/less_rails_bootstrap/custom_bootstrap/custom_bootstrap_generator'

class CustomBootstrapGeneratorTest < Rails::Generators::TestCase
  tests LessRailsBootstrap::Generators::CustomBootstrapGenerator

  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  def setup
    run_generator
  end

  test "custom_bootstrap.less is generated" do
    file_path = "app/assets/stylesheets/custom_bootstrap/custom_bootstrap.less"
    assert_file(file_path, /@import/)
    assert_equal 2312, File.size(File.expand_path(file_path, destination_root)), 'Looks like content of custom_bootstrap.less was changed. Please, investigate the reason of this and fix test if these changes is appropriate.'
  end

  test "variables.less is generated" do
    assert_file("app/assets/stylesheets/custom_bootstrap/variables.less",
      "// Use this file to override Twitter Bootstrap variables or define own variables.\n")
  end

  test "mixins.less is generated" do
    assert_file("app/assets/stylesheets/custom_bootstrap/mixins.less",
      "// Use this file to override Twitter Bootstrap mixins or define own mixins.\n")
  end
end
