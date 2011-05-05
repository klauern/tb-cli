module Tbox
  class Rack < Thor

    default_task :init

    desc "init", "Initialize a new Rack-based Application"
    def init
      setup = yes? "Would you like to set up a new Rack-based Application?"
      if setup
        say "awesome", Thor::Color::BOLD + Thor::Color::RED, false
        say ", let's get to work"
        project = ask "Name of project: " 

      else
        say "Shucks"
      end
    end
  end
end

