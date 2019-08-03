# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendcloud/version'

Gem::Specification.new do |spec|
  spec.name          = "sendcloud-ruby"
  spec.version       = Sendcloud::VERSION
  spec.authors       = ["Peter Berkenbosch"]
  spec.email         = ["peter@pero-ict.nl"]
  spec.summary       = %q{ruby client for the sendcloud api}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"

  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'rubocop', '0.73.0'
  spec.add_development_dependency 'rubocop-rspec', '1.35.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-console'
  spec.add_development_dependency 'coveralls'
end
