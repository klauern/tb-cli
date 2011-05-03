module Tbox
  class Add < Thor

    include Thor::Actions
    
    desc "add application", "Application"
    def application
      puts "you added an application setting"
    end

    desc "add web", "Web"
    def web
      puts "you added a web component"
    end

    desc "add ruby", "Ruby"
    def ruby
      puts "you added ruby configs"
    end

    desc "add environment", "Environment"
    def environment
      puts "adding an environment setting"
    end

    desc "add queue", "Queue"
    def queue
      puts "add a queue"
    end

    desc "add topic", "Topic"
    def topic
      puts "add a topic"
    end

    desc "add messaging", "Messaging"
    def messaging
      puts "add messaging options"
    end

    desc "add task", "Task"
    def task
      puts "add some task"
    end

    desc "add job", "Job"
    def job
      puts "add a job"
    end

    desc "add service", "Service"
    def service
      puts "add a service"
    end

    desc "add auth", "Auth"
    def auth
      puts "add some auth things"
    end

    desc "add pooling", "Pooling"
    def pooling
      puts "Pooling Options"
    end

    def help(meth=nil)
      puts INIT
      super
    end

  end
end


