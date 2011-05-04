module Tbox
  class Remove < Thor

    include Thor::Actions

    desc "remove application", "Application"
    method_option :root_loc, :type => :boolean, :desc => "root for your application"
    method_option :env, :type => :boolean, :desc => "Environment to run under (development, test, production)"
    def application
      y = ConfigFile.new destination_root
      y.remove_config('application', 'root') if options.root_loc
      y.remove_config('application', 'env') if options.env
      replace_yaml(y.yaml)
    end

    desc "remove web", "Web"
    method_option :rackup, :type => :boolean, :default => "config.ru", :desc => "Rackup file (default config.ru)"
    method_option :host, :type => :boolean, :default => "localhost", :desc => "virtual host to run as (default localhost)"
    method_option :context, :type => :boolean, :default => "/", :desc => "path under http://host/ to deploy to (default: '/')"
    method_option :static, :type => :boolean, :desc => "Any static web content provided should be put here (default: none)"
    def web
      y = ConfigFile.new destination_root
      y.remove_config('web', 'rackup') if options.rackup
      y.remove_config('web', 'host') if options.host
      y.remove_config('web', 'context') if options.context
      y.remove_config('web', 'static') if options.static
      replace_yaml(y.yaml)
    end

    desc "remove ruby", "Ruby"
    def ruby
      puts "you added ruby configs"
    end

    desc "remove environment", "Environment"
    def environment
      puts "adding an environment setting"
    end

    desc "remove queue", "Queue"
    method_option :name, :type => :string, :required => true
    method_option :durable => false
    def queue
      y = ConfigFile.new
      y.remove_config('queues', "/queues/#{options.name}")
      replace_yaml(y.yaml)
    end

    desc "remove topic", "Topic"
    method_option :name, :type => :string, :required => true
    def topic
      y = ConfigFile.new destination_root
      y.remove_config('topics', "/topics/#{options.name}")
      replace_yaml(y.yaml)
    end

    desc "remove messaging", "Messaging"
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

    desc "remove task", "Task"
    def task
      puts "add some task"
    end

    desc "remove job", "Jobs"
    method_option :job_name, :type => :string, :required => true
    method_option :cron, :type => :string, :required => true, :desc => <<-CRON
    crontab-like entry,  Similar to the following:
      
        '0 */5 * * * ?'
    CRON
    method_option :description, :type => :string, :desc => "Optional Description"
    def job
      puts "job was attempted to be created"
    end

    desc "remove service", "Service"
    method_option :name, :type => :string, :desc => "Service Name"
    method_option :params, :type => :hash, :desc => "key:value pairs to supply for this service"
    method_option :singleton, :type => :boolean, :desc => "Will this be a singleton operation?"
    def service
      puts "add a service"
    end

    desc "remove auth", "Auth"
    method_option :auth_type, :type => :string, :desc => "Authentication type"
    method_option :domain, :type => :string, :desc => "domain to authenticate against"
    def auth
      puts "add some auth things"
    end

    desc "remove pooling", "Pooling"
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


