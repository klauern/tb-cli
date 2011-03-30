require 'slop'

module Tbox
  module Template

    class Cli

      def run
        opts = Slop.parse do
          banner "Usage: tb [options]"
          on :c, :context, "Deploy to context [location]"
          on :a, :app, "Application Name [name]"
          on :s, :sinatra, "Use Sinatra?"
        end
        unless ARGV.size > 0
          puts opts
        end
        create_tb_app(opts)
      end

      def create_tb_app(opts)
      
      end
    end
  end
end
