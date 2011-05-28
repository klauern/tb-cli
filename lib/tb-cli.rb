$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
require 'rubygems'
require 'thor'
require 'thor/group'

module Tbox
  class Cli < Thor
    require 'tb-cli/camel_case'
    require 'tb-cli/descriptions'
    require 'tb-cli/cli/add'
    require 'tb-cli/cli/rack'
    require 'tb-cli/config_file'

    register Tbox::Add, "add", "add [component]", ADD
    register Tbox::Rack, "rack", "rack [project_name]", RACK

    def help(meth=nil)
      puts BANNER
      super
    end

    # override the Basic shell with the colorized one in Thor
    def self.start(*)
      Thor::Base.shell = Thor::Shell::Color
      super
    end

    BANNER = <<-BAN
Torquebox CLI  

  tb [action] [options]     # See below for more details on actions

Use this template generator to make quick Rack applications.  If you want a 
rails app, please use the application template provided by Torquebox 
(http://torquebox.org/documentation/DEV/rails.html#using-the-rails-application-template):

  rails new my_app -m $TORQUEBOX_HOME/share/rails/template.rb

    BAN

  end
end
Tbox::Cli.start
