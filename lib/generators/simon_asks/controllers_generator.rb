# Thanks to radar / forem
# The code used to inspire this generator!
require 'rails/generators'
module SimonAsks
  module Generators
    class ControllersGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path("../../../../app/controllers/simon_asks", __FILE__)
      desc "Used to copy simon_asks' controllers to your application's controllers folder."

      def copy_controllers
        controller_file 'quesions_controller.rb'
        controller_file 'quesion_answers_controller.rb'
      end

      protected

      def controller_file(name)
        copy_file name.to_s, "app/controllers/simon_asks/#{name}"
      end
    end
  end
end