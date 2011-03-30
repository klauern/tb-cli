require 'slop'

module Tbox
  module Template

    class Cli

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
    end
  end
end
