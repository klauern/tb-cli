module Tbox
  class Add < Thor

    include Thor::Actions

    desc "add application", "Application"
    long_desc <<-DESC
      Add an application component descriptor to your project.  See

      http://torquebox.org/documentation/1.0.1/deployment-descriptors.html#general-application-config-in-descriptor

      for more details.  The two options you have at your disposal are:

      root_loc: location for your project (/path/to/my/app) 
      env: your environment (development, test, production) 
    DESC
    method_option :root_loc, :type => :string, :desc => "root for your application"
    method_option :env, :type => :string, :desc => "Environment to run under (development, test, production)"
    def application
      y = ConfigFile.new destination_root
      if options.root_loc || options.env
        y.add_config('application', 'root', options.root_loc) if options.root_loc
        y.add_config('application', 'env', options.env) if options.env
        replace_yaml(y.yaml)
      else
        puts "You need to specify either --root-loc or --env"
      end
    end

    desc "add web", "Web"
    long_desc <<-DESC
    Add web-specific configuration to your application.  Since Torquebox can deploy multiple applications
    under one hostname, extra configuration options are allowed to make deployment easier.  If you want to 
    specify the specific 'rackup.ru' script for your app, configure with --rackup=location.  You can specify
    a specific context that this application will be avaialble for (such as /application) by using --context.

    Virtual hosts can also be configured with the --host option.  Finally, you can also specify a location for
    your static web content can be pointed to by using the --static=location option.

    See http://torquebox.org/documentation/1.0.1/deployment-descriptors.html#web-specific-config-in-descriptor
    for more details.
    DESC
    method_option :rackup, :type => :string, :default => "config.ru", :desc => "Rackup file (default config.ru)"
    method_option :host, :type => :string, :default => "localhost", :desc => "virtual host to run as (default localhost)"
    method_option :context, :type => :string, :default => "/", :desc => "path under http://host/ to deploy to (default: '/')"
    method_option :static, :type => :string, :desc => "Any static web content provided should be put here (default: none)"
    def web
      y = ConfigFile.new destination_root
      y.add_config('web', 'rackup', options.rackup) if options.rackup
      y.add_config('web', 'host', options.host) if options.host
      y.add_config('web', 'context', options.context) if options.context
      y.add_config('web', 'static', options.static) if options.static
      replace_yaml(y.yaml)
    end

    desc "add ruby", "Ruby"
    long_desc <<-DESC
    Add Ruby runtime configurations for your web application.  JRuby allows for a couple different runtime options:
    Ruby interpreter version (1.8 or 1.9 through --version), and compile mode (jit, force, off) through --compile_mode.

    See http://torquebox.org/documentation/1.0.1/deployment-descriptors.html#ruby-runtime-config-in-descriptor
    for more details.
    DESC
    method_option :version, :type => :numeric, :desc => "Ruby interpreter version, either 1.8 or 1.9"
    method_option :compile_mode, :type => :string, :desc => "Compile mode (jit, force, or off)"
    def ruby
      y = ConfigFile.new destination_root
      if [ 1.8, 1.9 ].include? options.version
        y.add_config('ruby', 'version', options.version)
      end
      if [ 'jit', 'force', 'off' ].include? options.compile_mode
        y.add_config('ruby', 'compile_mode', options.compile_mode)
      end
      replace_yaml(y.yaml)
    end

    desc "add environment", "Add an environment variable, such as MAIL_HOST or REPLY_TO"
    method_option :options, :type => :hash, :desc => "Add options as you need them: --options=MAIL_HOST:server REPLY_TO:emailaddress, etc., etc."
    def environment
      y = ConfigFile.new destination_root
      options.options.each_pair { |k,v|
        y.add_config('environment', k, v)
      }
      replace_yaml(y.yaml)
    end

    desc "add queue", "Add a Queue to your application"
    long_desc <<-DESC
    Queues are a messaging component that can be often used in load balancing situations.  For sending and receiving
    messages, you define a topic to queue up all of the work to be done, and subscribe a number of queue handlers
    to retrieve messages off of the queue as the work arrives.  Adding a queue to your application is pretty easy. 
    Just add the --name=queue_name.  An additional option --not_durable, can be appended to prevent any messages from
    being written to disk in case of server failure.  By default, all queues are durable, but if you want to disable this
    functionality, you can do so.

    Much more detailed documentation on queues and topics can be found on the Torquebox site, including documentation
    on how to interact with a queue, sending and receiving messages and the like:

    http://torquebox.org/documentation/1.0.1/messaging.html
    DESC
    method_option :name, :type => :string, :required => true
    method_option :not_durable, :type => :boolean, :default => false, :desc => "Disable Durable subscriber (at your own risk)"
    def queue
      file = 'queues.yml'
      y = ConfigFile.new destination_root, file
      if (options.not_durable && options.name)
        y.add_config("/queues/#{options.name}", "durable: #{!options.not_durable}")
      elsif (options.name)
        y.add_config("/queues/#{options.name}")
      end
      #require 'pry'
      #binding.pry
      replace_yaml(y.yaml, file) 
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
    method_option :subsystem, :type => :string, :desc => "Subsystem type (web, jobs, messaging, services)",
      :required => true
    method_option :bounded, :type => :hash, :desc => "min:1, max:3, etc"
    method_option :shared, :type => :boolean, :desc => "use this if not using bounded pooling"
    def pooling
      thing = {}
      thing["pooling"] = {}
      case options.subsystem
      when 'web'
        if options.bounded
          puts options.bounded
          thing["pooling"]["web"] = options.bounded
          puts thing.to_yaml
        elsif options.shared
          thing["pooling"]["web"] = "shared"
        end
      when 'jobs'
        puts "using a jobs pooling"
      when 'messaging'
        puts "using messaging"
      when 'services'
        puts "using services"
      else
        raise "Unknown subsystem.  Must be one of:\n  * web\n  * jobs\n  * messaging\n  * services"
      end
    end

    def help(meth=nil)
      puts INIT
      super
    end

    no_tasks do

      def replace_yaml(yaml_f, file='torquebox.yml')
        puts "Saving:\n"
        remove_file(file)
        create_file(file, yaml_f)
      end
    end
  end
end


