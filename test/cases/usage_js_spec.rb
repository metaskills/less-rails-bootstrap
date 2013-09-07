require 'spec_helper'

class UsageJsSpec < Less::Rails::Bootstrap::Spec
  
  describe 'application.js' do
    
    let(:app_js) { dummy_asset('application.js') }
    
    it 'will render main bootstrap.js file and all included modules' do
      files = ['affix', 'alert', 'button', 'carousel', 'collapse', 'dropdown', 'modal',
               'popover', 'scrollspy', 'tab', 'tooltip', 'transition']
      files.each do |file|
        app_js.must_include "#{file}.js"
      end
    end
    
    it 'must include basic js afterward' do
      app_js.must_include '$(document).ready(function(){...});'
    end
    
  end
  
  describe 'individual.js' do
    
    let(:individual_js) { dummy_asset('individual.js') }
    
    it 'will render bootstrap variables and mixins' do
      individual_js.must_include 'modal.js'
    end
    
  end


end
