require 'nazca'
require 'rails'

module Nazca
  class Railtie < Rails::Railtie
    def self.insert!
      ActionView::Base.send(:include, Nazca::ViewHelpers)
    end
    
    initializer 'paperclip.insert_into_active_record' do
      ActiveSupport.on_load :action_view do
        Nazca::Railtie.insert!
      end
    end
  end
end
