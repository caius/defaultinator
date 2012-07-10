# -*- encoding: utf-8 -*-
require File.expand_path('../lib/defaultinator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Caius Durling"]
  gem.email         = ["caius@emberads.com"]
  gem.description   = %q{Allows you to set default values when setting attributes using attr_accessor or attr_reader.}
  gem.summary       = %q{Set default values on attributes in one line}
  gem.homepage      = "http://github.com/caius/defaultinator"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "defaultinator"
  gem.require_paths = ["lib"]
  gem.version       = Defaultinator::VERSION

  gem.add_development_dependency "rspec", "> 2.0.0"
end
