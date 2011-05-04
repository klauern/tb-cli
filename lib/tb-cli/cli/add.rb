module Tbox
  class Add < Thor

    require 'tb-cli/cli/application'

    include Thor::Actions
    
    register Tbox::AddApp, "app", "add app", "Add Application components (root, env)"

    #desc "add application", "Application"
    #def application
      #puts "you added an application setting"
    #end

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
      y.add_config('queues', "/queues/#{options.name}")
      replace_yaml(y.yaml)
    end

    desc "add topic", "Topic"
    method_option :name, :type => :string, :required => true
    def topic
      y = ConfigFile.new destination_root
      y.add_config('topics', "/topics/#{options.name}")
      replace_yaml(y.yaml)
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

    desc "add job", "Jobs"
    method_option :job_name, :type => :string, :required => true
    method_option :cron, :type => :string, :required => true, :desc => <<-CRON
    crontab-like entry,  Similar to the following:
      
        '0 */5 * * * ?'
    CRON
    method_option :description, :type => :string, :desc => "Optional Description"
    def job
      puts "job was attempted to be created"
    end

    desc "add service", "Service"
    method_option :name, :type => :string, :desc => "Service Name"
    method_option :params, :type => :hash, :desc => "key:value pairs to supply for this service"
    method_option :singleton, :type => :boolean, :desc => "Will this be a singleton operation?"
    def service
      puts "add a service"
    end

    desc "add auth", "Auth"
    method_option :auth_type, :type => :string, :desc => "Authentication type"
    method_option :domain, :type => :string, :desc => "domain to authenticate against"
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

    no_tasks do

      def replace_yaml(yaml_f)
        puts "Saving:\n"
        remove_file('torquebox.yml')
        create_file('torquebox.yml', yaml_f)
      end
    end
  end
end


