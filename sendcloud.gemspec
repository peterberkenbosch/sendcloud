# frozen_string_literal: true

require_relative "lib/sendcloud/version"

Gem::Specification.new do |spec|
  spec.name = "sendcloud-ruby"
  spec.version = Sendcloud::VERSION
  spec.authors = ["Peter Berkenbosch"]
  spec.email = ["info@peterberkenbosch.nl"]

  spec.summary = "Ruby client for the Sendcloud API"
  spec.description = spec.summary
  spec.homepage = "https://github.com/peterberkenbosch/sendcloud"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/peterberkenbosch/sendcloud"
  # spec.metadata["changelog_uri"] = "https://github.com/peterberkenbosch/sendcloud/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.require_paths = ["lib"]
  spec.add_dependency "faraday", '2.9.0'
  spec.add_dependency "faraday_middleware"

  spec.add_development_dependency "standard"
end
