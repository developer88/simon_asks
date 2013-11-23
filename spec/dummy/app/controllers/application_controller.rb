class ApplicationController < ActionController::Base
  protect_from_forgery

  def simons_user
  	current_user
  end

end
