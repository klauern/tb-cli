require 'rubygems'
require 'thor'
#$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
require 'tb-cli/actions/new'

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

module Things
class Tbox < Thor
  require 'tb-cli/actions/new'

  default_task :show_banner

  # Default task to show when no options are passed in.
  desc "help", "Show this help message"
  def show_banner
    puts BANNER
    help
  end
  
  BANNER = <<-BAN
Torquebox CLI  
tb-cli [action] [options]     # See below for more details on actions

Use this template generator to make quick Rack applications.  If you want a rails app, please use the 
application template provided by Torquebox: http://torquebox.org/documentation/DEV/rails.html#using-the-rails-application-template

rails new my_app -m $TORQUEBOX_HOME/share/rails/template.rb
  
  BAN
end
