module Tbox
  class Initialize < Thor
    include Thor::Actions
    
    desc "init", "Initialize a new Torquebox Application"
    def init
      puts "You Called it WOOHOO"
    end

    def help(meth=nil)
      puts INIT
      super
    end

  end
end


