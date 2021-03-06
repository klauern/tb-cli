Torquebox CLI
=============
The command-line app for making [Torquebox][1] even louder.

Usage
-----

    tb [action] [options]

Actions that you can perform are `rack` and `add`, which can be described
below.

### Add component with `tb add`
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

For help with any component you want to add, you can get help by typing `tb add
help [component]`, and you'll get some help.

### Create baseline Torquebox-Rack app with `tb rack`
Generate a Rack-based application.  A normal Rack-based Torquebox application
only needs a few files, which this generator helps fill out for you:

   * `project_name` folder
   * `project_name/config.ru` - Your Rackup file
   * `project_name/lib` directory
   * `project_name/app.rb` base application file that starts Rack
   * `project_name/Rakefile` with [Torquebox specific rake tasks][3]
   * `project_name/torquebox.yml` - Your Torquebox config file
   * `project_name/Gemfile` if you decide to use it as a Gem


More Help
=========

If you are unfamiliar with the layout of the `torquebox.yml` file or don't know
what all this gobbledygook means, you can always reference the torquebox documentation, from
which much of this application is based off of.

http://torquebox.org/documentation/

Why
---
Torquebox is a really awesome project and I was interested in doing something
with it.  Since there didn't appear to be any project-generator-type
thing in place, I decided to make one.  This is as much an experiment with
[Thor][2] as it is an interest in providing Torquebox a command-line application
to spin up TB apps quickly.

Obviously, if you find bugs, report them, throw a pull request my way, and
feel free to critique the hell out of this.  This is my first project in the
Ruby space, and I'm more interested in making this a good app, even if it's not
entirely useful to anybody.

### Note:
I have no tests at all for this.  I'm interested in trying to test it, but I'm
not entirely sure how I would test a command-line app when much of it's
functionality is wrapped in Thor (which I trust to do its job) tasks and such.

To Do
=====
I don't have an interest in adding too many more features, but I have a small list of things
I'd like to include to fill it out a bit:

  * wrap [rake tasks][3]
  * include the [rails template generator][4] provided by the Torquebox team

  [1]: http://www.torquebox.org/
  [2]: http://www.github.com/wycats/thor
  [3]: http://torquebox.org/documentation/1.0.1/deployment.html#deploy-using-rake
  [4]: http://torquebox.org/documentation/1.0.1/web.html#using-the-rails-application-template
