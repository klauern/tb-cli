# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tb-cli/version"

Gem::Specification.new do |s|
  s.name        = "tb-cli"
  s.version     = Tbox::Cli::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nick Klauer"]
  s.email       = ["klauer@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Create simple Torquebox.yml templates for your Torquebox, Rack-based applications.}
  s.description = %q{Torquebox (http://www.torquebox.org) is a JBoss Application Server that will run your
  Rack and Rails apps in JRuby.  Torquebox provides a number of additional functionality that you might find useful, such
  as messaging, background services, and scheduled tasks.  Configuring those is incredibly easy, since they all rely on
  simple YAML file configs.  This CLI application simplifies that further by lettnig you generate your applications and
  application templates with simple command line executions.}

  s.add_development_dependency "rspec"
  s.add_development_dependency "sinatra"
  s.add_dependency "thor"

  s.executables << "tb"

  s.rubyforge_project = "tb-cli"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
