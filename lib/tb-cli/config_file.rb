module Tbox
  class ConfigFile
    require 'yaml'

    attr_accessor :config, :torquebox_yml

    def initialize(destination_root=nil)
      @torquebox_yml = File.join(destination_root, '/torquebox.yml')
      if config_present?
        @config = YAML.load_file @torquebox_yml
      else
        @config = {}
      end
    end

    def config_present?
      File.exist? @torquebox_yml
    end

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
    def add_config(meth, config, value=nil)
      conf = @config[meth.to_s] || {}
      conf[config.to_s] = value
      @config[meth.to_s] = conf
      puts "Current torquebox.yml configuration file:\n\n#{yaml}\n"
    end

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

