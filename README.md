Torquebox CLI
=============
The command-line app for making Torquebox even louder.

Usage
-----

    tb [action] [options]

Why
---

Torquebox is a really awesome project and I was interested in doing something
with the efforts.  Since there didn't appear to be any project-generator-type
thing in place, I decided to make one.  This is as much an experiment with
Thor as it is an interest in making Torquebox have a command-line application
that you can create and spin up quick TB apps.

List of actions
---------------
There are 3 core things I'm trying to tackle:
  * `tb add` - Add a component (topic, queue, job, task, config, etc) to your
    `torquebox.yml` file
  * `tb remove` - Remove one of those
  * `tb rack` - Generate a project skeleton for your Rack apps

There is a great `template.rb` that is out there for Rails-based apps that you
want to run on Torquebox.  If that's what you're after, please go there and use
that:
    rails new my_app -m $TORQUEBOX_HOME/share/rails/template.rb

Details on Actions
------------------
  * `tb init` - initialize and create your `torquebox.yml` file for your project
  * `tb add [component]` - add a component to your torquebox application.
    Types of components can be:
      * `application` - Application types
      * `web` - WEb configuration settings
      * `ruby` - version of ruby you want to set, including compilation options
      * `environment` - add and remove environment variables for the runtime of
      	your JRuby App
      * `queue` - manipulate queues (create, rename, remove)
      * `topic` - create a topic
      * `messaing` - set up handlers for your queues/topics
      * `task` - create a task with a concurrency setting
      * `job` - create an external job, including various settings around it
      	(job class, description, crontab)
      * `service` - Create a long-running service that runs in the background
      * `auth` - configure your authorization settings
      * `pooling` - Runtime pooling options

Not all application components are implemented.  See documentation below for
more information what is and isn't implemented:

### application
To Be Implemented

### web
To Be Implemented

### ruby
To Be Implemented

### environment
To Be Implemented

### queue
To Be Implemented

### topic
To Be Implemented

### messaging
To Be Implemented

### task
To Be Implemented

### job
To Be Implemented

### service
To Be Implemented

### auth
To Be Implemented

### pooling
To Be Implemented

