$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'action_view'
require 'nazca'

Nazca::Railtie.insert!

