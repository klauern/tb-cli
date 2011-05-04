module Tbox
  class AddApp < Thor

    include Thor::Actions

    desc "add app env", "Add Environment Variables"
    def env
      puts "Howdy env"
    end

    desc "add app root-loc", "Root Application location configs"
    def root_loc
      puts "here in root"
    end

  end
end
