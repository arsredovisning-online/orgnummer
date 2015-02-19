# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orgnummer/version'

Gem::Specification.new do |spec|
  spec.name          = "orgnummer"
  spec.version       = Orgnummer::VERSION
  spec.authors       = ["Jonas"]
  spec.email         = ["jonas.lundstrom@mirendo.se"]
  spec.description   = %q{Create and validate format of the swedish organisationsnummer}
  spec.summary       = %q{Util for creation and validation of the swedish organisationsnummer}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
