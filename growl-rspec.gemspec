# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "growl/rspec/version"

Gem::Specification.new do |s|
  s.name        = "growl-rspec"
  s.version     = Growl::RSpec::VERSION
  s.authors     = ["dpree"]
  s.email       = ["whiterabbit.init@gmail.com"]
  s.homepage    = "https://github.com/dpree/growl-rspec"
  s.summary     = %q{Publishing RSpec results via Growl}
  s.description = %q{Provides a new RSpec formatter that uses growlnotify}

  s.rubyforge_project = "growl-rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rspec", "~> 3.0"
  s.add_runtime_dependency "growl"
end
