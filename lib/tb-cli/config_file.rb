module Tbox
  # ConfigFile class provides some simple YAML configuration file helpers.
  # While normal YAML methods within Ruby are fine (and used heavily), these
  # helpers assist in adding, removing, and replacing configurations for the
  # Torquebox.yml default specification file.  These methods make adding
  # a config to the torquebox.yml much easier, as it abstracts out the details
  # of having to know the underlying data structure (Hashes, Arrays, boolean,
  # string) and just pass in to this ConfigFile the pieces you want to add
  class ConfigFile
    require 'yaml'

    attr_accessor :config, :torquebox_yml

    # Create and/or open a YAML configuration file
    # [destination_root] Directory that you will find the YAML file
    # [file] Filename of the YAML file to load
    def initialize(destination_root=nil, file='torquebox.yml')
      @filename = file
      @torquebox_yml = File.join(destination_root, @filename)
      if config_present?
        @config = YAML.load_file @torquebox_yml
      else
        @config = {}
      end
    end

    # Is the configuration file there or does a new config there to laod?
    def config_present?
      File.exist? @torquebox_yml
    end

    # Convert config to YAML
    def yaml
      @config.to_yaml
    end

    # Dynamically adds to the config object based on what was passed in through
    # Thor
    #
    # @param [Thor::CoreExt::HashWithIndifferentAccess] options options hash given to you by Thor
    # @param [String] meth string of the method passed in
    # @param [String] config what the config for that method sets
    # @param [String] value value assocated with it
    #
    # @return [String] the YAML output for this config, e.g.:
    #     options = HashWithIndifferentAccess.new 'topic' => 'some_topic_name'
    #     add_config(options, "topics", "topic"
    #
    #     ---
    #     topics:
    #       some_topic_name:
    def add_config(root, config=nil, value=nil)
      conf = @config[root.to_s] || {}
      conf[config.to_s] = value if config
      @config[root.to_s] = nil  # Some attributes need no settings and just exist, like queues.yml
      @config[root.to_s] = conf unless conf.empty?
      puts "Current #{@filename} configuration file:\n\n#{yaml}\n"
    end

    # Not tested or documented
    def remove_config(meth, config)
      conf = @config[meth.to_s]
      unless conf
        puts "No such config available for #{meth}"
      else
        puts "removing config \n\t#{config}"
        begin
          @config.delete(config)
        rescue e
          puts "No such config #{config} to remove, skipping..."
        end
      end
    end
  end
end

