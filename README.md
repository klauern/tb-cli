Torquebox CLI
=============
The command-line app for making [Torquebox][1] even louder.

Usage
-----

    tb [action] [options]

Actions that you can perform are `rack` and `add`, which can be described
below.

=== `tb add`
Add a component to your torquebox.yml.  Torquebox provides a number of features
that make writing Rack and Rails-based applications a breeze, such as messaging
features, background services, cron-like tasks, and service pooling.

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

For help with any component you wnat to add, you can get help by typing `tb add
help [component]`, and you'll get some help.

Why
---
Torquebox is a really awesome project and I was interested in doing something
with the efforts.  Since there didn't appear to be any project-generator-type
thing in place, I decided to make one.  This is as much an experiment with
Thor as it is an interest in making Torquebox have a command-line application
that you can create and spin up quick TB apps.

Obviously, if you find bugs, report them, throw a pull request my way, and
feel free to critique the hell out of this.  I obviously have the right to
feel offended and ignore you, but I'll try not to be. ;)

List of actions
---------------
There are 3 core things I'm trying to tackle:

  * `tb add` - Add a component (topic, queue, job, task, config, etc) to your
    `torquebox.yml`, `queues.yml`, or `topics.yml` files
  * `tb rack` - Generate a project skeleton for your Rack apps
  * `tb rails` - Generate a new Rails project using a Torquebox template.

There is a great `template.rb` that is out there for Rails-based apps that you
want to run on Torquebox.  If that's what you're after, please go there and use
that instead:

    rails new my_app -m $TORQUEBOX_HOME/share/rails/template.rb

Details on Actions
------------------
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


[1]: http://www.torquebox.org/
