require 'cancan'

module SimonAsks
  class Ability
    include CanCan::Ability

    # Thanks for Forem gem for the following methods
    class_attribute :abilities
    self.abilities = Set.new

    # Allows us to go beyond the standard cancan initialize method which makes it difficult for engines to
    # modify the default +Ability+ of an application.  The +ability+ argument must be a class that includes
    # the +CanCan::Ability+ module.  The registered ability should behave properly as a stand-alone class
    # and therefore should be easy to test in isolation.
    def self.register_ability(ability)
      self.abilities.add(ability)
    end

    def self.remove_ability(ability)
      self.abilities.delete(ability)
    end

    def initialize(user, params)

      if user
=begin
      # Just and Example
      # TODO do smth to automatically include it into main app
      can [:read], SimonAsks::Question
      # if user
      
        # Comments
        can [:create], SimonAsks::Comment do |c|
          if c.owner
            c.owner.respond_to?(:closed?) ? !c.owner.closed? : true
          end
        end
        can [:update], SimonAsks::Comment do |c|
          c.user_id == user.id
        end
        can [:destroy], SimonAsks::Comment do |c|
          c.user_id == user.id
        end
        # Questions
        can [:create], SimonAsks::Question
        can [:update], SimonAsks::Question do |q|
          q.user_id == user.id
        end
        can [:upvote, :downvote], SimonAsks::Question do |q|
          q.user_id != user.id
        end
        # Answers
        can [:create], SimonAsks::QuestionAnswer
        can [:update], SimonAsks::QuestionAnswer do |a|
          a.user_id == user.id
        end
        can [:upvote, :downvote], SimonAsks::QuestionAnswer do |a|
          a.user_id != user.id
        end
        # Answer comments
        can [:create], :answer_comment
        can [:destroy], :answer_comment do
          SimonAsks::Comment.find(params[:id]).user_id == user.id
        end
        # question comments
        can [:create], :question_comment
        can [:destroy], :question_comment do
          SimonAsks::Comment.find(params[:id]).user_id == user.id
        end

        if user.is? :admin
          can :manage, :all
        end
=end        

        #include any abilities registered by extensions, etc.
        Ability.abilities.each do |clazz|
          ability = clazz.send(:new, user)
          @rules = rules + ability.send(:rules)
        end

      end

    end
    
  end
end