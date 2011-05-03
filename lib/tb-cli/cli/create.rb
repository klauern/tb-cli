module Tbox
  class Create < Thor
    include Thor::Actions
    
    desc "create rack", "Create a new Rack Application Template"
    def rack
      puts "You Called it WOOHOO"
    end


    no_tasks do
      def help
        puts "Hi"
      end
    end 
  end
end
