module Tbox
  ## Rack tasks for your application.
  class Rack < Thor

    # For use with generating Rack-based projects
    include Thor::Actions

    default_task :init

    desc "init", "Initialize a new Rack-based Application"
    # Initialize a new Rack-based Application
    def init
      setup = yes? "Would you like to set up a new Rack-based Application?"
      if setup
        say "awesome!", Thor::Color::BOLD + Thor::Color::RED, false
        say " let's get to work"
        @project = ask "Name of project: " 
        if @project
          gen_project @project
        else
          say "You need to supply a project name"
        end
      else
        say "Shucks"
      end
    end

    no_tasks do

      # Generates a new project with the provided name:
      #   [project_name]   Name of the project and subsequent folder to create
      #                    the project for
      def gen_project(project_name)
        say_status "new_project", project_name
        Tbox::Rack.source_root(File.expand_path(File.join(__FILE__, "..", "..")))
        empty_directory(project_name)
        empty_directory(project_name + "/lib")
        %w{ app.rb config.ru Rakefile torquebox.yml README Gemfile }.each { |f|
          template("templates/#{f}.tt", "#{project_name}/#{f}")
        }
      end

      def method_missing(name, *args) # :nodoc:
        @project = name.to_s.underscore
        gen_project name.to_s.underscore
      end
    end

  end
end

