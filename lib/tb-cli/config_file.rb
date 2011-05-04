module Tbox
  class ConfigFile
    require 'yaml'
    attr_accessor :config

    def initialize
      @torquebox_yml = File.expand_path(File.dirname(__FILE__) + "/torquebox.yml")
      if config_present?
        @config = YAML.load_file f
      else
        @config = {}
      end
    end

    def save_yaml
      f = File.new(@torquebox_yml, "w")
      f << @config.to_yaml
    end

    def config_present?
      File.exist? @torquebox_yml
    end

    def yaml
      @config.to_yaml
    end

  end
end

