module SimonAsks
  class Engine < ::Rails::Engine
    isolate_namespace SimonAsks

    # Thanks for ActiveAdmin for the piece of code
    if Rails.version > "3.1"
      initializer "SimonAsks precompile assets", :group => :all do |app|
        app.config.assets.precompile += %w(simon_asks.js simon_asks.css)
      end
    end

  end
end


