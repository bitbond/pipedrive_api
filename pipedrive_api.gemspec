# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pipedrive_api/version'

Gem::Specification.new do |spec|
  spec.name          = "pipedrive_api"
  spec.version       = PipedriveApi::VERSION
  spec.authors       = ["gareth"]
  spec.email         = ["gareth@bitbond.com"]

  spec.summary       = %q{A wrapper for the Pipedrive API.}
  spec.description   = %q{A wrapper for the Pipedrive API.}
  spec.homepage      = "https://github.com/bitbond/pipedrive_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.3"

  spec.add_dependency "httparty"
end
