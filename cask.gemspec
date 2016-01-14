# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cask/version'

Gem::Specification.new do |spec|
  spec.name          = "cask"
  spec.version       = Cask::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Will H McMahan"]
  spec.email         = ["will@mcmahan.me"]

  spec.summary       = %q{A simple relible float based grid system}
  spec.description   = %q{A simple relible float based grid system}
  spec.homepage      = "http://whmii.github.io/cask"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bourbon", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
