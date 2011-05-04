$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
require 'rubygems'
require 'thor'
require 'thor/group'

module Tbox
  class Cli < Thor
    require 'tb-cli/descriptions'
    require 'tb-cli/cli/initialize'
    require 'tb-cli/cli/add'
    require 'tb-cli/config_file'

    register Tbox::Initialize, "init", "init", "initialize Torquebox.yml file"
    register Tbox::Add, "add", "add [component]", ADD

    def help(meth=nil)
      puts BANNER
      super
    end

    BANNER = <<-BAN
Torquebox CLI  

    tb-cli [action] [options]     # See below for more details on actions

Use this template generator to make quick Rack applications.  If you want a 
rails app, please use the application template provided by Torquebox 
(http://torquebox.org/documentation/DEV/rails.html#using-the-rails-application-template):

    rails new my_app -m $TORQUEBOX_HOME/share/rails/template.rb

    BAN

  end
end

Tbox::Cli.start
