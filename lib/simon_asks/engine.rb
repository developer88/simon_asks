module SimonAsks
  class Engine < ::Rails::Engine
    isolate_namespace SimonAsks

    # Precompile any assets included straight in certain pges
    initializer "simon_asks.assets.precompile", :group => :all do |app|
     # app.config.assets.precompile += %w[
      #  forem/admin/members.js
      #]
    end


  end
end

require 'acts_as_votable'
require 'auto_html_for'
