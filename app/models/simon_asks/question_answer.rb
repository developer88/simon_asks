module SimonAsks
  class QuestionAnswer < ActiveRecord::Base
    #
    # Relations
    belongs_to :user, :class_name => SimonAsks.user_class
    belongs_to :question, counter_cache: :answers_count
    has_many :comments, as: 'owner'

    acts_as_votable

    #
    # Accesses
    attr_accessible :content, :user, :question

    #
    # Validation
    validates_presence_of :content
    # validates_format_of :content, :with => /\A[[:graph:]]\Z/i
    validates_presence_of :user
    validates_presence_of :question

    default_scope order('cached_votes_score DESC, created_at ASC')

    scope :accepted_only, proc { |a| a.accepted == true }

    auto_html_for :content do
      html_escape
      image
      youtube(:width => 400, :height => 250)
      link :target => "_blank", :rel => "nofollow"
      simple_format
    end

    #
    # Methods
    def can_edit?(user)
      self.user == user
    end

    # upvotes minus downvotes
    def score
      upvotes.size - downvotes.size
    end

    def accept!
      accepted = true
      save!
    end

    def reject!
      accepted = false
      save!
    end

  end
end
