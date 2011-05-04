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
    method_option :name, :type => :string, :required => true
    method_option :durable => false
    def queue
      y = ConfigFile.new
      queues = y.config["queues"] || {}
      queues['/queues/' + options.name] = nil
      y.config["queues"] = queues
      puts y.yaml
    end

    desc "add topic", "Topic"
    method_option :name, :type => :string, :required => true
    def topic
      y = ConfigFile.new
      topics = y.config["topics"] || {}
      topics['/topics/' + options.name] = nil
      y.config["topics"] = topics
      puts y.yaml
    end

    desc "add messaging", "Messaging"
    method_option :queue, :type => :string, :desc => "Name of the queue (/queues/my_queue_name:)"
    method_option :topic, :type => :string, :desc => "Name of the topic (/topics/my_topic_name:)"
    method_option :handler_class, :type => :string
    def messaging
      if options.queue == nil && options.topic == nil
        puts "You must specify either a topic or a queue you're configuring a handler for"
      else
        if options.handler_class
          y = ConfigFile.new
          messaging = y.config["messaging"] || {}
          if options.queue
            messaging[options.queue] = options.handler_class
          elsif options.topic
            messaging[options.topic] = options.handler_class
          end
          y.config["messaging"] = messaging
          puts y.yaml
        else
          puts "You must specify a --handler-class"
        end
      end
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


