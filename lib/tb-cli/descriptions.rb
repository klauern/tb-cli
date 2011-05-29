# Description for when you pass in the 'add' method execution.
ADD = <<-COMPONENT
Add a new component to the torquebox.yml file.  The type of component can be:

  - application
  - web
  - ruby
  - environment
  - queue
  - topic
  - messaging
  - task
  - job
  - service
  - auth
  - pooling

For more help on a particular subcommand, enter

  tb add help [component]

COMPONENT

MESSAGING_LONG = <<-MSG
Messaging
=========
For more information, go to (http://torquebox.org/documentation/1.0.0/messaging.html#messaging-consumers) for information (figure 8.15, specifically):

  messaging:
    /queues/foo:
      MyFooHandler:
        filter: "cost > 30"
        config:
          type: "premium"
          season: "fall"
        concurrency: 2
    /topics/bar:
      MyBarHandler:
        durable: true

MSG

RACK = <<-RCK
Create a new Rack Application template.  By default, will generate the following:

  project_folder
  |- app.rb         (Application stub)
  |- config.ru      (Rackup file)
  |- Rakefile       (Rake with Torquebox configs)
  |- torquebox.yml  (Torquebox config)

Much of this would be much similar to a rails app, but if you 
have an interest in doing something more lightweight, you might
find this template more appealing and minimal.
RCK
