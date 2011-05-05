require 'rake/clean'
require 'bundler'
Bundler::GemHelper.install_tasks

CLOBBER.include( 'pkg/', 'doc/' )

task :default => ["spec", "build"]
