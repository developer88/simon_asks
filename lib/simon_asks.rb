require 'acts_as_votable'
require 'auto_html'
require 'acts-as-taggable-on'
require 'pg'
require 'pg_search'

require "simon_asks/engine"

module SimonAsks

  mattr_accessor :user_class #Blorgh.user_class
  mattr_accessor :current_user_helper

end
