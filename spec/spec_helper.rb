# frozen_string_literal: true

require "action_view"
require "nazca"

Nazca::Railtie.insert!

RSpec.configure do |config|
  config.disable_monkey_patching!
end
