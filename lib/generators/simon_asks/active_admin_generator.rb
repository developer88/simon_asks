# Thanks to radar / forem
# The code used to inspire this generator!
require 'rails/generators'
module SimonAsks
  module Generators
    class ActiveAdminGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path("../../../../app/admin", __FILE__)
      desc "Used to copy simon_asks' ActiveAdmin Resources to your application's admin folder."

      def copy_aa_resources
        template 'questions.rb', 'app/admin/simon_asks_questions.rb'
        template 'question_answers.rb', 'app/admin/simon_asks_question_answers.rb'
        template 'comments.rb', 'app/admin/simon_asks_comments.rb'
      end

    end
  end
end