require 'spec_helper'

class UsageCssSpec < Less::Rails::Bootstrap::Spec
  
  describe 'application.css' do
    
    let(:app_css) { dummy_asset('application.css') }
    
    it 'will render main bootstrap.less file and all included modules' do
      app_css.must_include 'Bootstrap @VERSION',          'From boostrap.less'
      app_css.must_include 'Forms.less',                  'From forms.less'
      app_css.must_include 'Snippets of reusable CSS',    'From mixins.less'
      app_css.must_include 'Patterns.less',               'From patterns.less'
      app_css.must_include 'Scaffolding',                 'From scaffolding.less'
      app_css.must_include 'Tables.less',                 'From tables.less'
      app_css.must_include 'Typography.less',             'From type.less'
      app_css.must_include 'Variables.less',              'From variables.less'
    end
    
    it 'must include basic css afterward' do
      app_css.must_include '#other-css { color: red; }',  'From our code afterward.'
    end
    
  end
  
  describe 'framework.css.less' do
    
    before { dummy_config.less.compress = true }
    
    let(:framework_css) { dummy_asset('framework.css') }
    
    it 'will render bootstrap functions' do
      border_radius_line = line_for_framework_css('framework-border-radius')
      border_radius_line.must_include '-webkit-border-radius:4px'
      border_radius_line.must_include '-moz-border-radius:4px'
      border_radius_line.must_include 'border-radius:4px'
    end
    
    it 'will render bootstrap variables' do
      link_color_line = line_for_framework_css('framework-linkColor')
      link_color_line.must_include 'color:#0069d6;'
    end
    
  end
  
  describe 'individual.css.less' do
    
    before { dummy_config.less.compress = true }
    
    let(:individual_css) { dummy_asset('individual.css') }
    
    it 'will render bootstrap variables and mixins' do
      my_button_line = line_for_individual_css('individual-my-button')
      my_button_line.must_include '-webkit-border-radius:10px'
      my_button_line.must_include '-moz-border-radius:10px'
      my_button_line.must_include 'border-radius:10px'
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
