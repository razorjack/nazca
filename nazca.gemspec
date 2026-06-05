# frozen_string_literal: true

require_relative "lib/nazca/version"

Gem::Specification.new do |spec|
  spec.name = "nazca"
  spec.version = Nazca::VERSION
  spec.authors = ["Jacek Galanciak"]
  spec.email = ["jacek.galanciak@gmail.com"]
  spec.homepage = "https://github.com/razorjack/nazca"
  spec.summary = "Meta tags for Rails views."
  spec.description = "Rails gem that makes title and meta tags (keywords, description) easy and manageable."
  spec.license = "MIT"

  spec.required_ruby_version = ">= 3.3"

  spec.metadata = {
    "source_code_uri" => spec.homepage,
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "rubygems_mfa_required" => "true"
  }

  spec.files = `git ls-files -z`.split("\x0").select { |f| f.start_with?("lib/", "README", "MIT-LICENSE") }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionview", ">= 7.2"
  spec.add_dependency "railties", ">= 7.2"

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard", ">= 1.50"
end
