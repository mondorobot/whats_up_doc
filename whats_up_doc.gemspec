# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whats_up_doc/version'

Gem::Specification.new do |spec|
  spec.name          = "whats_up_doc"
  spec.version       = WhatsUpDoc::VERSION
  spec.authors       = ["Allen Madsen"]
  spec.email         = ["blatyo@gmail.com"]
  spec.summary       = %q{Provides a low-level up route for load balancers.}
  spec.description   = %q{Provides a low-level up route for load balancers. Useful for injecting before loggin, so load balancers don't pollute the log.}
  spec.homepage      = "https://github.com/secondrotation/whats_up_doc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rack'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
