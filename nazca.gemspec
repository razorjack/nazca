# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nazca/version"

Gem::Specification.new do |s|
  s.name        = "nazca"
  s.version     = Nazca::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jacek Galanciak"]
  s.email       = ["jacek.galanciak@gmail.com"]
  s.homepage    = "http://razorjack.net"
  s.summary     = %q{Meta tags for Rails 3 views.}
  s.description = %q{Rails 3 plugin that makes title and meta tags (keywords, description) easy and manageable.}

  s.rubyforge_project = "nazca"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency("rails", ["~> 3.0"])
  
  s.add_development_dependency "rspec", ["~> 2.0"]
end
