module SimonAsks
  class Rate < ActiveRecord::Base
    belongs_to :rater, :class_name => SimonAsks.user_class
    belongs_to :rateable, :polymorphic => true
    validates_numericality_of :stars, :greater_than => 0
    
    attr_accessible :rate, :dimension
  end
end
