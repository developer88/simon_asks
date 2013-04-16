class AddCachedScoreIndexForQuestionAnswers < ActiveRecord::Migration
  def change
    add_index :simon_asks_question_answers, :cached_votes_score
  end
end
