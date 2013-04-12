module SimonAsks
  class Comment < ActiveRecord::Base
    STATES = %w(all pending spam approved)

    acts_as_nested_set

    attr_accessible :content, :owner_id, :owner_type, :parent_id
    attr_accessible :state, :user_id, as: 'admin'

    belongs_to :owner, polymorphic: true, counter_cache: true
    belongs_to :user, :class_name => SimonAsks.user_class

    before_create do
      self.state = 'pending'
    end
    after_destroy do
      # need for nested set
      owner_type.constantize.reset_counters(owner_id, :comments)
    end

    default_scope order('created_at DESC')
    scope :ordered, order { [created_at.desc, owner_type, owner_id, depth, user_id] }
    scope :by_state, proc { |s| s.blank? || s == 'all' ? scoped : where(state: s) }
    scope :published, proc { |user| where { |q| (q.state == 'approved') | (q.user_id == user.try(:id)) }.order(:created_at) }
    scope :by_owner, proc { |owner| where(owner_id: owner.id, owner_type: owner.class.to_s) }

    validates :content, presence: true

    def is?(state)
      self.state == state.to_s
    end

    def only_children(user)
      self.class.where(parent_id: id).published(user)
    end

    def self.statuses
      STATES
    end

  end
end
