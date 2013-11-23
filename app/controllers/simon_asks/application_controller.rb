module SimonAsks
  class ApplicationController < ApplicationController
    helper SimonAsks::Engine.helpers

    check_authorization

    # simons_user

    #private

    #def current_ability
    #  @current_ability ||= SimonAsks::Ability.new(current_user, request.params)
    #end




  end
end
