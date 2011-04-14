require 'rubygems'
require 'thor'

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
require 'tb-cli/actions/new'

class Tbox < Thor

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

Tbox.start
=begin

  def run
    opts = Slop.new(:strict => true) do
      banner "Usage: tb [options]"
      on :c, :context, "Deploy to context [location]", true, :as => String
      on :a, :app, "Application Name [name]", true, :as => String
      on :s, :sinatra, "Use Sinatra?"
      on :h, :help, "Show detailed Help"
    end
    unless ARGV.size > 0
      puts opts
    else
      begin
        opts.parse
      rescue Slop::InvalidOptionError => e
        puts "\n#{e.message}\n\n"
        puts opts
        exit
      end
    end
    create_tb_app(opts)
  end

  def create_tb_app(opts)
    if opts.sinatra?
      puts "Yay I like Sinatra, too"
    end
    if opts.context?
      puts "You want to put the app in /#{opts[:context]}"
    end
    if opts.app?
      puts "App name will be called #{opts[:app]}"
    end
  end
=end
