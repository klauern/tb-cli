#require 'rake/clean'
require 'rdoc'
require 'rdoc/task'
require 'bundler'

Bundler::GemHelper.install_tasks

# How the hell is this broken?
# 
#CLOBBER.include( 'pkg/', 'doc/' )

task :default => ["spec", "build"]

# And this, too...
Rake::RDocTask.new do |rd|
  rd.rdoc_files.include("lib/**/*.rb", "README.md")
  rd.options << "--o doc"
end
