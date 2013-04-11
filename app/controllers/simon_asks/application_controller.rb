module SimonAsks
  class ApplicationController < ApplicationController
    helper SimonAsks::Engine.helpers

    private

    def current_ability
      @current_ability ||= SimonAsks::Ability.new(current_user, request.params)
    end

  end
end
