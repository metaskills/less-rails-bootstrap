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

  test "content of custom_bootstrap.less was changed" do
    md5 = Digest::MD5.file(destination_root.join("app/assets/stylesheets/custom_bootstrap/custom_bootstrap.less")).hexdigest
    assert_equal '5df8ad55b43c4880aeda200e78285948', md5,
      'Looks like content of custom_bootstrap.less was changed. Please, investigate the reason of this and fix test if these changes are appropriate.'
  end

  test "custom_bootstrap.less is generated" do
    assert_file(destination_root.join("app/assets/stylesheets/custom_bootstrap/custom_bootstrap.less"), /@import/)
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
