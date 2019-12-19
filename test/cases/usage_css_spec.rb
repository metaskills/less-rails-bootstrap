require 'spec_helper'

class UsageCssSpec < Less::Rails::Bootstrap::Spec

  describe 'application.css' do
    let(:app_css) { dummy_asset('application.css') }

    it 'will render main bootstrap.less file and all included modules' do
      assert_includes app_css, '.text-center' # From type.less
      assert_includes app_css, '.panel-default' # From panels.less
    end

    it 'must include basic css afterward' do
      assert_includes app_css, '#other-css { color: red; }',  'From our code afterward.'
    end

  end

  describe 'fonts.css.less' do

    let(:app_css) { dummy_asset('fonts.css.less') }

    it 'uses less-rails asset-url helper for fonts' do
      assert_includes app_css,  "/assets/twitter/bootstrap/glyphicons-halflings-regular"
    end

  end

  describe 'framework.css.less' do
    before { dummy_config.less.compress = true }

    let(:framework_css) { dummy_asset('framework.css') }

    it 'will render bootstrap functions' do
      border_radius_line = line_for_framework_css('framework-box-shadow')
      assert_includes border_radius_line, '-webkit-box-shadow:4px'
      assert_includes border_radius_line, 'box-shadow:4px'
    end

    it 'will render bootstrap variables' do
      link_color_line = line_for_framework_css('framework-linkColor')
      assert_includes link_color_line, 'color:#337ab7'
    end

  end

  describe 'individual.css.less' do

    before { dummy_config.less.compress = true }

    let(:individual_css) { dummy_asset('individual.css') }

    it 'will render bootstrap variables and mixins' do
      my_button_line = line_for_individual_css('individual-my-button')
      assert_includes my_button_line, '-webkit-box-shadow:10px'
      assert_includes my_button_line, 'box-shadow:10px'
    end
  end


  private

  def line_for_framework_css(name)
    framework_css.each_line.detect{ |line| line.include? name }.strip
  end

  def line_for_individual_css(name)
    individual_css.each_line.detect{ |line| line.include? name }.strip
  end

end
