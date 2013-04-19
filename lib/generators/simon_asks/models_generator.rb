# Thanks to radar / forem
# The code used to inspire this generator!
require 'rails/generators'
module SimonAsks
  module Generators
    class ModelsGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path("../../../../app/models/simon_asks", __FILE__)
      desc "Used to copy simon_asks' models to your application's models folder."

      def copy_models
        model_file 'comment.rb'
        model_file 'question.rb'
        model_file 'question_answer.rb'
      end

      protected

      def model_file(name)
        copy_file name.to_s, "app/models/simon_asks/#{name}"
      end
    end
  end
end