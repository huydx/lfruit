# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lfruit/version'

Gem::Specification.new do |spec|
  spec.name          = "lfruit"
  spec.version       = Lfruit::VERSION
  spec.authors       = ["huydx"]
  spec.email         = ["doxuanhuy@gmail.com"]
  spec.summary       = %q{linh fruit crawler}
  spec.description   = %q{crawler eagerly crawl EVERYTHING that have specified format}
  spec.homepage      = "huydx.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "celluloid"
  spec.add_runtime_dependency "colorize"
  spec.add_runtime_dependency "activesupport", "~>4.0"
end
