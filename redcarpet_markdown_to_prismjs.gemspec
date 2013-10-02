# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redcarpet_markdown_to_prismjs/version'

Gem::Specification.new do |spec|
  spec.name          = "redcarpet_markdown_to_prismjs"
  spec.version       = RedcarpetMarkdownToPrismjs::VERSION
  spec.authors       = ["Tomas Valent"]
  spec.email         = ["equivalent@eq8.eu"]
  spec.description   = %q{Lazy implemetation for markdown with Redcarpet and Prism.js syntax highlight}
  spec.summary       = %q{Gem for Prism.js implementation to Redcarpet}
  spec.homepage      = "http://eq8.eu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "redcarpet"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"   , "~> 2"
  spec.add_development_dependency "capybara", "~> 2.1"
end
