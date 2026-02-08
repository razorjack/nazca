# -*- encoding: utf-8 -*-
require_relative "lib/nazca/version"

Gem::Specification.new do |s|
  s.name        = "nazca"
  s.version     = Nazca::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jacek Galanciak"]
  s.email       = ["jacek.galanciak@gmail.com"]
  s.homepage    = "https://github.com/razorjack/nazca"
  s.summary     = %q{Meta tags for Rails views.}
  s.description = %q{Rails plugin that makes title and meta tags (keywords, description) easy and manageable.}
  s.license     = "MIT"

  s.required_ruby_version = ">= 3.0"

  s.files         = `git ls-files`.split("\n").select { |f| File.exist?(f) }.reject { |f| f.match(%r{^(spec/|gemfiles/)}) }
  s.require_paths = ["lib"]

  s.add_dependency("rails", [">= 7.0"])

  s.add_development_dependency "rspec", ["~> 3.0"]
end
