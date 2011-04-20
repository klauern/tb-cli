module Things
  class Create < ::Tbox
    namespace :fun

    desc "rack", "Create a new Rack Application Template"
    def rack
      puts "You Called it WOOHOO"
    end
  end
end
