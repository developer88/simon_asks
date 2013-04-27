require 'acts_as_votable'
require 'auto_html'
require 'acts-as-taggable-on'
require 'awesome_nested_set'
require 'pg'
require 'pg_search'
require 'cancan'
require 'devise'
require 'carrierwave'

# i guess we do not need lot's of this requirements
require 'kaminari'
require 'haml'
require 'haml-rails'

require "simon_asks/engine"

module SimonAsks

  mattr_accessor :user_class #Blorgh.user_class
  mattr_accessor :current_user_helper

end
