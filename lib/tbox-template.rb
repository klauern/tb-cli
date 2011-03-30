require 'slop'

module Tbox
  module Template

    class Cli

      def run
        opts = Slop.new(:strict => true) do
          banner "Usage: tb [options]"
          on :c, :context, "Deploy to context [location]"
          on :a, :app, "Application Name [name]"
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

      end
    end
  end
end
