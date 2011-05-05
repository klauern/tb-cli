module Tbox
  class Rack < Thor

    include Thor::Actions

    default_task :init

    desc "init", "Initialize a new Rack-based Application"
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

      def gen_project project_name
        say_status "new_project", project_name
        Tbox::Rack.source_root(File.expand_path(File.join(__FILE__, "..", "..")))
        empty_directory(project_name)
        template('templates/app.rb.tt', "#{project_name}/app.rb")
        template('templates/config.ru.tt', "#{project_name}/config.ru")
        template('templates/Rakefile.tt', "#{project_name}/Rakefile")
        template('templates/torquebox.yml.tt', "#{project_name}/torquebox.yml")
        template('templates/README.tt', "#{project_name}/README")
      end

      def method_missing name, *args
        @project = name
        gen_project name
      end
    end

  end
end

