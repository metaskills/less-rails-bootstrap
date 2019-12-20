require 'spec_helper'

class UsageJsSpec < Less::Rails::Bootstrap::Spec
  
  describe 'application.js' do
    
    let(:app_js) { dummy_asset('application.js') }
    
    it 'will render main bootstrap.js file and all included modules' do
      files = ['affix', 'alert', 'button', 'carousel', 'collapse', 'dropdown', 'modal',
               'popover', 'scrollspy', 'tab', 'tooltip', 'transition']
      files.each do |file|
        assert_includes app_js, "#{file}.js"
      end
    end
    
    it 'must include basic js afterward' do
      assert_includes app_js, '$(document).ready(function(){...});'
    end
    
  end
  
  describe 'individual.js' do
    
    let(:individual_js) { dummy_asset('individual.js') }
    
    it 'will render bootstrap variables and mixins' do
      assert_includes individual_js, 'modal.js'
    end
    
  end
end
