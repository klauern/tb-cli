module Tbox
  class YamlProcessor
    require 'yaml'
    attr_accessor :yaml

    def initialize
      @torquebox_yml = File.expand_path(File.dirname(__FILE__) + "/torquebox.yml")
      if File.exist? f
        @yaml = YAML.load_file f
      else
        @yaml = {}
      end
    end

    def save_yaml
      f = File.new(@torquebox_yml, "w")
      f << @yaml.to_yaml
    end

  end
end

