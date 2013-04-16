module SimonAsks
  class Engine < ::Rails::Engine
    isolate_namespace SimonAsks

    # Thanks for ActiveAdmin for the piece of code
    if Rails.version > "3.1"
      initializer "SimonAsks precompile assets", :group => :all do |app|
        app.config.assets.precompile += %w(simon_asks.js simon_asks.css)
      end
    end

    def routes(rails_router)
      load!
      router.apply(rails_router)
    end

    #initializer 'simon_asks.action_controller' do |app|
    #  ActiveSupport.on_load :action_controller do
    #    helper SimonAsks::QuestionsHelper
    #  end
    #end    

  end
end


