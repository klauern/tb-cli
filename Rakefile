gem 'rdoc'
require 'rdoc/task'
require 'rake/clean'
require 'bundler'

Bundler::GemHelper.install_tasks

CLEAN.include('*.tmp')
CLOBBER.include('*.tmp', 'pkg/', 'html/')

# Default is to build and generate docs.  No tests yet, so can't do that
task :default => ["build", "rdoc"]

# Document gem and place in html/
Rake::RDocTask.new do |rd|
  rd.main = "README.md"
  rd.rdoc_files.include("lib/**/*.rb", "README.md")
end
