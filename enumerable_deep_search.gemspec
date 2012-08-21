# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enumerable_deep_search/version'

Gem::Specification.new do |gem|
  gem.name          = "enumerable_deep_search"
  gem.version       = EnumerableDeepSearch::VERSION
  gem.authors       = ["Anthony Cook"]
  gem.email         = ["anthonymichaelcook@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  %w{
    rspec guard-rspec pry pry-nav pry-doc pry-theme pry-coolline pry-highlight pry-buffers
  }.each do |g|
    gem.add_development_dependency g
  end
end
