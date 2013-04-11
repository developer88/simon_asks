module SimonAsks
  class ApplicationController < ApplicationController
    helper SimonAsks::QuestionsHelper

    private

    def current_ability
      @current_ability ||= SimonAsks::Ability.new(current_user, request.params)
    end

  end
end
