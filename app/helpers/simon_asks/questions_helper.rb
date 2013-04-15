module SimonAsks
  module QuestionsHelper
    def number_of_answers(question)
      question.answers_count ? question.answers_count : 0
    end

    def show_tag_list(question)
      raw question.tag_list.map { |t| link_to t, simon_asks.questions_tag_path(t), class: 'plink' }.join(', ')
    end

    def current_path
      request.env['PATH_INFO']
    end

    def show_more_questions?(user)
      true if Question.where(user_id: user).count > 3
    end

    def show_more_answers?(user)
      true if QuestionAnswer.where(user_id: user).count > 3
    end
  end
end