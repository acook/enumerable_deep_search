# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enumerable_deep_search/version'

Gem::Specification.new do |gem|
  gem.name          = "enumerable_deep_search"
  gem.version       = EnumerableDeepSearch::VERSION
  gem.authors       = ["Anthony Cook"]
  gem.email         = ["anthonymichaelcook@gmail.com"]
  gem.description   = %q{Recursively searches enumerable objects and their nested objects for a given object or string.}
  gem.summary       = %q{Recursively searches through enumerable objects.}
  gem.homepage      = "https://github.com/acook/enumerable_deep_search"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  %w{
    rspec guard-rspec pry pry-nav pry-doc pry-theme pry-coolline pry-highlight pry-buffers rake
  }.each do |g|
    gem.add_development_dependency g
  end
end
