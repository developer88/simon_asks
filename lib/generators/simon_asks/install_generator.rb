# Thanks to radar / forem
# The code used to inspire this generator!
require 'rails/generators'
module SimonAsks
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option "user_class", :type => :string
      class_option "no-migrate", :type => :boolean
      class_option "aa-install", :type => :boolean
      class_option "current_user_helper", :type => :string

      source_root File.expand_path("../install/templates", __FILE__)
      desc "Used to install SimonAsks"

      def install_migrations
        puts "Copying over SimonAsks migrations..."
        Dir.chdir(Rails.root) do
          `rake simon_asks:install:migrations`
        end
      end

      def determine_user_class
        @user_class = options["user_class"].presence ||
                      ask("What is your user class called? [User]").presence ||
                      'User'
      end

     # def determine_current_user_helper
    #    current_user_helper = options["current_user_helper"].presence ||
     #                         ask("What is the current_user helper called in your app? [current_user]").presence ||
    ##                          :current_user

#        puts "Defining simon_asks_user method inside ApplicationController..."

#        simon_asks_user_method = %Q{
#  def simon_asks_user
#    #{current_user_helper}
#  end
#  helper_method :simon_asks_user
#
#}

 #       inject_into_file("#{Rails.root}/app/controllers/application_controller.rb",
  #                       simon_asks_user_method,
  #                       :after => "ActionController::Base\n")

     # end

      def add_simon_asks_initializer
        path = "#{Rails.root}/config/initializers/simon_asks.rb"
        if File.exists?(path)
          puts "Skipping config/initializers/simon_asks.rb creation, as file already exists!"
        else
          puts "Adding simon asks initializer (config/initializers/simon_asks.rb)..."
          template "initializer.rb", path
        end
      end

      def run_migrations
        unless options["no-migrate"]
          puts "Running rake db:migrate"
          `rake db:migrate`
        end
      end

      def setup_active_admin_directory
        aa_install = options["aa-install"].presence ||
                      ask("Should ActiveAdmin resources be installed? [Yn]").presence ||
                      'Y'

        if aa_install == 'Y'
          puts "Creating ActiveAdmin resources"
          template 'questions.rb', 'app/admin/simon_asks_questions.rb'
          template 'question_answers.rb', 'app/admin/simon_asks_question_answers.rb'
          template 'comments.rb', 'app/admin/simon_asks_comments.rb'
        end
      end

     # def seed_database
       # load "#{Rails.root}/config/initializers/simon_asks.rb"
       # unless options["no-migrate"]
       #   puts "Creating default forum and topic"
       #   Forem::Engine.load_seed
       # end
      #end

      def mount_engine
        puts "Mounting SimonAsks::Engine at \"/qa\" in config/routes.rb..."
        insert_into_file("#{Rails.root}/config/routes.rb", :after => /routes.draw.do\n/) do
          %Q{
  mount SimonAsks::Engine => "/qa"

}
        end
      end

      def finished
        output = "\n\n" + ("*" * 53)
        output += %Q{\nCongratulation! SimonAsks was successfully installed!\n\n}
        output += %Q{\nDo not forget to run `rake db:migrate` because some new migrations were created for you.\n\n}
        output += %Q{\nOficial documentation can be found here: https://github.com/developer88/simon_asks .\n\n}
        puts output
      end

      private

      def user_class
        @user_class
      end

      def next_migration_number
        last_migration = Dir[Rails.root + "db/migrate/*.rb"].sort.last.split("/").last
        current_migration_number = /^(\d+)_/.match(last_migration)[1]
        current_migration_number.to_i + 1
      end
    end
  end
end