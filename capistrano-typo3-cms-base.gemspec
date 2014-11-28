# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/typo3/cms/base/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-typo3-cms-base"
  spec.version       = Capistrano::Typo3::Cms::Base::VERSION
  spec.authors       = ["Jose Antonio Guerra"]
  spec.email         = ["balderiano@gmail.com"]
  spec.summary       = %q{Deploy TYPO3 CMS projects with Capistrano 3}
  spec.description   = %q{Lean approach for deploying TYPO3 projects}
  spec.homepage      = "https://github.com/jaguerra/capistrano-typo3-cms-base"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "capistrano", "~> 3.2"
end
