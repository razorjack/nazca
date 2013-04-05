require 'nazca'
require 'rails'

module Nazca
  class Railtie < Rails::Railtie
    def self.insert!
      ActionView::Base.send(:include, Nazca::ViewHelpers)
    end
    
    initializer 'nazca.insert_into_action_view' do
      ActiveSupport.on_load :action_view do
        Nazca::Railtie.insert!
      end
    end
  end
end
