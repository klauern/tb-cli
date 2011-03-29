# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tbox-template/version"

Gem::Specification.new do |s|
  s.name        = "tbox-template"
  s.version     = Tbox::Template::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nick Klauer"]
  s.email       = ["klauer@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Create simple Torquebox templates for your Rack-based applications.}
  s.description = %q{In creating a new Torquebox integration, there are alot of common files that you would
                     normally use to set up your context to deploy to, what the name of the app is, and
                     other general-purpose deployment information.  Simplify that with this gem.}

  s.add_development_dependency "rspec"
  s.add_development_dependency "sinatra"
  s.add_dependency "slop"
  
  s.rubyforge_project = "tbox-template"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
