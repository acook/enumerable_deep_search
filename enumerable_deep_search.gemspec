# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enumerable_deep_search/version'

Gem::Specification.new do |gem|
  gem.name          = "enumerable_deep_search"
  gem.version       = EnumerableDeepSearch::VERSION
  gem.authors       = ["Anthony Cook"]
  gem.email         = ["anthonymichaelcook@gmail.com"]
  gem.description   = %q{Recursively search enumerable objects for a given object or string.}
  gem.summary       = %q{Deep search for enumerable objects.}
  gem.homepage      = "https://github.com/acook/enumerable_deep_search#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end
