lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rav_meser_v2/version"

Gem::Specification.new do |spec|
  spec.name          = "rav_meser_v2"
  spec.version       = RavMeserV2::VERSION
  spec.authors       = ["Mahesh"]
  spec.email         = ["maheshbhise@ymail.com"]

  spec.summary       = %q{Rav Meser API V2}
  spec.description   = %q{Rav Meser API v2}
  spec.homepage      = "http://rubygems.org/gems/rav-meser-api"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https://github.com/MaheshBhise/responder-api-v2"
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'json', '~> 2.5.1'
  spec.add_runtime_dependency 'httparty', '~> 0.18.1'
  spec.add_runtime_dependency 'uri', '~> 0.10.1'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'json', '~> 2.5.1'
  spec.add_development_dependency 'httparty', '~> 0.18.1'
  spec.add_development_dependency 'uri', '~> 0.10.1'
  spec.add_development_dependency 'byebug'
end
